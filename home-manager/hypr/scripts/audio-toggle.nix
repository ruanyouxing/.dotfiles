{pkgs}:
pkgs.writeShellScript "output-toggle" ''
  DEVICE_ID=$(pw-dump | jq '.[] | select(.type=="PipeWire:Interface:Device") | select(.info.props."device.description" == "Built-in Audio") | .id')
  if [ -z "$DEVICE_ID" ]; then
    exit 1
  fi

  CURRENT_PORT=$(pw-dump | jq -r '.[] | select(.id == '"$DEVICE_ID"') | .info.params.Route[]? | select(.direction == "Output") | .name')

  if [[ "$CURRENT_PORT" == "analog-output-headphones" ]]; then
    pw-cli set-param $DEVICE_ID Route '{ index: 3, direction: "Output", device: 4, props: { mute: false } }'
  else
    pw-cli set-param $DEVICE_ID Route '{ index: 4, direction: "Output", device: 4, props: { mute: false } }'
  fi
''
