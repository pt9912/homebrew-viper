# viper.rb — Homebrew formula skeleton. The release workflow (job `homebrew`) fills the marked
# placeholders from the SHA256SUMS of the same tag, attaches the result to the release as
# viper.rb and puts it into the tap pt9912/homebrew-viper. Four platforms: Homebrew has no Windows.
class Viper < Formula
  desc "Set up and use Hetzner machines for Claude Code"
  homepage "https://github.com/pt9912/hetzner-viper"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.7.0/viper_v0.7.0_darwin_arm64"
      sha256 "a744f0ccaf83af866c675259aad72bc579beb9bbefda3dd940d53ef33f9e0c81"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.7.0/viper_v0.7.0_darwin_amd64"
      sha256 "3ab5ea974ce9b71a7b9dc3a40c178030532002003ad9297621d2b966225b5419"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.7.0/viper_v0.7.0_linux_arm64"
      sha256 "198dd909c9360633d227ac0eb5135f832f4e1c870de1031019a20392fde33baf"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.7.0/viper_v0.7.0_linux_amd64"
      sha256 "088d37bc705031fe4946510205c2902919d5da692f5ee83c96e845f7270b3d4d"
    end
  end

  def install
    bin.install Dir["viper_*"].fetch(0) => "viper"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/viper version")
  end
end
