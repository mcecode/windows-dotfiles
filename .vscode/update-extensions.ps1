try {
  $installedExtensions = code --list-extensions
} catch {
  Write-Output "Error: Listing installed extensions failed."
  Write-Output "Make sure Visual Studio Code is installed in your PATH."
  Write-Output "Press any key to exit."
  $HOST.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") > $null
  exit
}

if (Test-Path -Path "extensions.txt") {
  $extensionsToInstall = Get-Content -Path "extensions.txt"
} else {
  Write-Output "Error: 'extensions.txt' is missing."
  Write-Output "Make sure it is located in the same directory as this script."
  Write-Output "Press any key to exit."
  $HOST.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") > $null
  exit
}

foreach ($installedExtension in $installedExtensions) {
  if ( -not ($installedExtension -in $extensionsToInstall) ) {
    code --uninstall-extension $installedExtension
  }
}

foreach ($extensionToInstall in $extensionsToInstall) {
  if ( -not ($extensionToInstall -in $installedExtensions) ) {
    code --install-extension $extensionToInstall
  }
}
