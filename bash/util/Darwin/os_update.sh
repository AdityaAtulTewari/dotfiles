os_update() {
  brew update && brew upgrade && brew cleanup
  rustup update
}
