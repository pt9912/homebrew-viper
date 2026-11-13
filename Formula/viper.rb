# viper.rb — Homebrew formula skeleton. The release workflow (job `homebrew`) fills the marked
# placeholders from the SHA256SUMS of the same tag, attaches the result to the release as
# viper.rb and puts it into the tap pt9912/homebrew-viper. Four platforms: Homebrew has no Windows.
class Viper < Formula
  desc "Set up and use cloud machines for Claude Code"
  homepage "https://github.com/pt9912/hetzner-viper"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.21.0/viper_v0.21.0_darwin_arm64"
      sha256 "d43353a7cb7d0643f8a8335b1ad9c96bcd99f837f7492ff778ef72f11ee91f94"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.21.0/viper_v0.21.0_darwin_amd64"
      sha256 "0d4fb33f24129e5ba230df095f5453fe3a2b389a93909805aa987c176b8e750f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.21.0/viper_v0.21.0_linux_arm64"
      sha256 "93df9694c24891db02abec1376dbba87a37b2c900bc8481d228b0d10f4788757"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.21.0/viper_v0.21.0_linux_amd64"
      sha256 "c4c87b28c35e8934bba93db8719708d866d0f981d91f5942009d87f40361f8d9"
    end
  end

  def install
    bin.install Dir["viper_*"].fetch(0) => "viper"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/viper version")
  end
end
