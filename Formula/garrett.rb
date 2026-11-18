# garrett, the Sentinel agent, for Homebrew on macOS and Linux.
#
# packaging/package-managers.py fills in the version and each bundle's SHA-256 for a release, and the release
# publishes the result to the project's tap:  brew install gary23w/sentinels/garrett
#
# brew puts garrett's files in place. garrett runs as root, so it must run from a folder only root can change,
# never from Homebrew's, which the user who installed it can write to: the install line in the caveats copies it
# there (the same installer as the release bundle) and starts it now and at every boot.
class Garrett < Formula
  desc "Host intrusion sentinel that stops what it catches"
  homepage "https://github.com/gary23w/sentinels"
  version "1.9.2"
  license "MIT"

  on_macos do
    url "https://github.com/gary23w/sentinels/releases/download/v1.9.2/garrett-macos.tar.gz"
    sha256 "8e736fd8da8d6ef53546f8e747697d72c0ed9f014b3a09df59aafc3cb09687a3"
  end

  on_linux do
    on_intel do
      url "https://github.com/gary23w/sentinels/releases/download/v1.9.2/garrett-linux-x86_64.tar.gz"
      sha256 "0a5fe060bb6cfabb30d555f9af5fc503dd56c86d299961087f7b3bdfc4da9d2d"
    end
    on_arm do
      url "https://github.com/gary23w/sentinels/releases/download/v1.9.2/garrett-linux-aarch64.tar.gz"
      sha256 "29c5a90c59ea4767d6a0c97ed111df0ca301f31afb8f115ef7d683a9db4e4de6"
    end
  end

  def install
    libexec.install Dir["*"]
  end

  def caveats
    <<~EOS
      garrett runs as root, from a folder only root can change. To put it there and start it now and at
      every boot:
        sudo sh #{opt_libexec}/install.sh
      It keeps itself up to date from then on. To take it off this machine, before brew uninstall garrett:
        sudo sh #{opt_libexec}/install.sh --remove
    EOS
  end

  test do
    assert_match "garrett #{version}", shell_output("#{libexec}/garrett-agent version")
  end
end
