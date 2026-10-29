# viper.rb — Homebrew formula skeleton. The release workflow (job `homebrew`) fills the marked
# placeholders from the SHA256SUMS of the same tag, attaches the result to the release as
# viper.rb and puts it into the tap pt9912/homebrew-viper. Four platforms: Homebrew has no Windows.
class Viper < Formula
  desc "Set up and use cloud machines for Claude Code"
  homepage "https://github.com/pt9912/hetzner-viper"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.12.0/viper_v0.12.0_darwin_arm64"
      sha256 "000ff0fa5a93f411ac35c0ab700cd04a482687a107ed830927fa6daa17811b9b"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.12.0/viper_v0.12.0_darwin_amd64"
      sha256 "eb020f2afb7b98c05f7a8ee51f6f353ada20848a76012fcc864c1e24566228b6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.12.0/viper_v0.12.0_linux_arm64"
      sha256 "ea0a590b20abbde1d7eb3ff1ce0fcbe3a1be903d876a764933c96d12624abea8"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.12.0/viper_v0.12.0_linux_amd64"
      sha256 "01b6b4c83e192bb1d6f840293e86d7c52fbfc1de35ac0db5a2c0eb327323fcd4"
    end
  end

  def install
    bin.install Dir["viper_*"].fetch(0) => "viper"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/viper version")
  end
end
