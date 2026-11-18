# homebrew-sentinels

The Homebrew tap for [sentinels](https://github.com/gary23w/sentinels): garrett, the Sentinel agent, on macOS and Linux.

```sh
brew install gary23w/sentinels/garrett
```

garrett runs as root, so it runs from a folder only root can change, never from Homebrew's. After `brew install`, run the line it prints, which installs garrett there and starts it now and at every boot:

```sh
sudo sh "$(brew --prefix)/opt/garrett/libexec/install.sh"
```

To take it off the machine: `sudo sh "$(brew --prefix)/opt/garrett/libexec/install.sh" --remove`, then `brew uninstall garrett`.

Each sentinels release writes the formula here. It is made from `packaging/homebrew/garrett.rb` in the sentinels repository: changes go there.
