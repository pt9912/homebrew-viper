# viper.rb — Homebrew formula skeleton. The release workflow (job `homebrew`) fills the marked
# placeholders from the SHA256SUMS of the same tag, attaches the result to the release as
# viper.rb and puts it into the tap pt9912/homebrew-viper. Four platforms: Homebrew has no Windows.
class Viper < Formula
  desc "Set up and use Hetzner machines for Claude Code"
  homepage "https://github.com/pt9912/hetzner-viper"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.5.1/viper_v0.5.1_darwin_arm64"
      sha256 "1744b5c183d65eb7260a88e9d3c61f66eb9ae195e2f60e55e657e44ca9800cec"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.5.1/viper_v0.5.1_darwin_amd64"
      sha256 "90020c02fa6e0814c59c604d7e933435f84ff0238581a080d6a9eeb54559e12e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.5.1/viper_v0.5.1_linux_arm64"
      sha256 "8484e3223b5b791c5940146770d1ef62f1b25b05d423862cdc97b3e5e9b63941"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.5.1/viper_v0.5.1_linux_amd64"
      sha256 "24364e7fd9d9593a558d5dbb087a8ad9be3fa8914668c2f01cb2a64376d6c48b"
    end
  end

  def install
    bin.install Dir["viper_*"].fetch(0) => "viper"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/viper version")
  end
end
