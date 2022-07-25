#!/bin/bash

installed_extensions=$(code --list-extensions 2> /dev/null) || {
  echo "Error: Listing installed extensions failed." >&2
  echo "Error: Make sure Visual Studio Code is installed in your PATH." >&2
  exit
}

exec_dir=$(dirname $(realpath $0))
extensions_file="$exec_dir/extensions.txt"
if [ -f "$extensions_file" ]; then
  extensions_to_install=$(cat "$extensions_file")
else
  echo "Error: '$extensions_file' is missing." >&2
  exit
fi

for installed_extension in $installed_extensions; do
  if ! echo "$extensions_to_install" | grep $installed_extension > /dev/null
  then
    code --uninstall-extension $installed_extension
  fi
done

for extension_to_install in $extensions_to_install; do
  if ! echo "$installed_extensions" | grep $extension_to_install > /dev/null
  then
    code --install-extension $extension_to_install
  fi
done
