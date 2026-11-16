# viper.rb — Homebrew formula skeleton. The release workflow (job `homebrew`) fills the marked
# placeholders from the SHA256SUMS of the same tag, attaches the result to the release as
# viper.rb and puts it into the tap pt9912/homebrew-viper. Four platforms: Homebrew has no Windows.
class Viper < Formula
  desc "Set up and use cloud machines for Claude Code"
  homepage "https://github.com/pt9912/hetzner-viper"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.33.0/viper_v0.33.0_darwin_arm64"
      sha256 "072ab4cdc3d2b4c92e43fc926e04f31d115b32f35096f17c894cc1344b3e0a5f"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.33.0/viper_v0.33.0_darwin_amd64"
      sha256 "ba1a44949f7a143758ce2658376b78ffd7cec099e4aff6b1d8e41f21f6911926"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.33.0/viper_v0.33.0_linux_arm64"
      sha256 "55ff159647ae6577ed851ed7ff868b2370e1d6eca0722db27ac50e59979e45a5"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.33.0/viper_v0.33.0_linux_amd64"
      sha256 "f0e026cd5332ea91ceb4d849eaa11f876bea7dbe5932e485a22c1d4bd576774f"
    end
  end

  def install
    bin.install Dir["viper_*"].fetch(0) => "viper"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/viper version")
  end
end
