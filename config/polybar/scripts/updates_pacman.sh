if test -f "/sbin/pacman"; then
  echo "   $(checkupdates 2>/dev/null | wc -l)"
fi
