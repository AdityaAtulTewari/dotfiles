# Empty the trash folder used by the trash function

empty_trash() {
  read -p "empty_trash: are you sure you wish to empty the trash (this cannot be undone)? " reply

  if [[ $reply == y* || $reply == Y* ]]
  then
      rm -frv $TRASH
      mkdir -v $TRASH
      echo "empty_trash: finished"
  else
      echo "empty_trash: aborted"
  fi
}
