# viper.rb — Homebrew formula skeleton. The release workflow (job `homebrew`) fills the marked
# placeholders from the SHA256SUMS of the same tag, attaches the result to the release as
# viper.rb and puts it into the tap pt9912/homebrew-viper. Four platforms: Homebrew has no Windows.
class Viper < Formula
  desc "Set up and use cloud machines for Claude Code"
  homepage "https://github.com/pt9912/hetzner-viper"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.26.0/viper_v0.26.0_darwin_arm64"
      sha256 "d057ed58bee1d7a4887154d60c06a6b5be3dd595f498faae9e90ecb9af287e84"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.26.0/viper_v0.26.0_darwin_amd64"
      sha256 "7ba18b2e10fac1be83c017f25122817f9a3b5df1113061930257183221abbc1e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.26.0/viper_v0.26.0_linux_arm64"
      sha256 "13a0962dacca88d03e4fb8ab3ddb4432ce6ee9455495a60c36cc172662b11a21"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.26.0/viper_v0.26.0_linux_amd64"
      sha256 "5be90cfc1ebe490ef375cc41934a45f5363110fd3b8ba2d8a2c3e4d57982242f"
    end
  end

  def install
    bin.install Dir["viper_*"].fetch(0) => "viper"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/viper version")
  end
end
