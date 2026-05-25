import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Widgets
import Quickshell.Wayland
Scope {
  id: root
  PwObjectTracker {
    objects: [Pipewire.defaultAudioSink]
  }
  Connections {
    target: Pipewire.defaultAudioSink?.audio

    function onVolumeChanged() {
      root.shouldShowOsd = true;
      hideTimer.restart();
    }
  }

  property bool shouldShowOsd: false

  Timer {
    id: hideTimer
    interval: 1000
    onTriggered: root.shouldShowOsd = false
  }
  LazyLoader {
    active: root.shouldShowOsd
    PanelWindow {
      WlrLayershell.layer: WlrLayer.Overlay
      anchors.bottom: true
      margins.bottom: screen.height / 7

      implicitWidth: 400
      implicitHeight: 50
      color: "transparent"
      mask: Region {}
      Rectangle {
        anchors.fill: parent
        radius: height 
        color: "#18192600"

        RowLayout {
          anchors {
            fill: parent
            leftMargin: 10
            rightMargin: 15
          }

          IconImage {
            implicitSize: 30
            source: {
              if (Pipewire.defaultAudioSink.audio.volume > 0.5)
                return Qt.resolvedUrl("./assets/volume-high.svg");
              else if (Pipewire.defaultAudioSink.audio.volume == 0)
                return Qt.resolvedUrl("./assets/volume-off.svg");
              else if (Pipewire.defaultAudioSink.audio.volume < 0.5)
                return Qt.resolvedUrl("./assets/volume-low.svg");
            }
          }
          Rectangle {
            Layout.fillWidth: true

            implicitHeight: 25
            radius:20
            color: "#50ffffff"

            Rectangle {
              anchors {
                left: parent.left
                top: parent.top
                bottom: parent.bottom
              }

              implicitWidth: parent.width * (Pipewire.defaultAudioSink?.audio.volume ?? 0)
              radius: parent.radius
            }
          }
        }
      }
    }
  }
}
