# viper.rb — Homebrew formula skeleton. The release workflow (job `homebrew`) fills the marked
# placeholders from the SHA256SUMS of the same tag, attaches the result to the release as
# viper.rb and puts it into the tap pt9912/homebrew-viper. Four platforms: Homebrew has no Windows.
class Viper < Formula
  desc "Set up and use cloud machines for Claude Code"
  homepage "https://github.com/pt9912/hetzner-viper"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.20.1/viper_v0.20.1_darwin_arm64"
      sha256 "e572af9ca17ff7c55cb219adb983433c60183810270c257a9ce7548136f1f6f9"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.20.1/viper_v0.20.1_darwin_amd64"
      sha256 "5caf76f27b36443d46c84f185093d6f54d6a4991c73d35bb710963e82c13a491"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.20.1/viper_v0.20.1_linux_arm64"
      sha256 "4c084541716e281a5e6d96753f6a709ee68c33943766b9857da2b65a86636b89"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.20.1/viper_v0.20.1_linux_amd64"
      sha256 "b59f5428a8c01797786c6d945832640a7ab10d68282901a99c51d320621ea667"
    end
  end

  def install
    bin.install Dir["viper_*"].fetch(0) => "viper"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/viper version")
  end
end
