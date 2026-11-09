# viper.rb — Homebrew formula skeleton. The release workflow (job `homebrew`) fills the marked
# placeholders from the SHA256SUMS of the same tag, attaches the result to the release as
# viper.rb and puts it into the tap pt9912/homebrew-viper. Four platforms: Homebrew has no Windows.
class Viper < Formula
  desc "Set up and use cloud machines for Claude Code"
  homepage "https://github.com/pt9912/hetzner-viper"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.15.0/viper_v0.15.0_darwin_arm64"
      sha256 "9f27003b7d633d5b09e6c64f432e55cbd77042a11aba6811fdaa8096fe78c21d"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.15.0/viper_v0.15.0_darwin_amd64"
      sha256 "b803d6079d7b997c63bfddd17da10337962a879ff265e3f981a4e831e1703d59"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.15.0/viper_v0.15.0_linux_arm64"
      sha256 "d199d87ce8852c0184586a0d6a98f01da8752fae286212d307ca12ddec23cf75"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.15.0/viper_v0.15.0_linux_amd64"
      sha256 "cb8888a1ebb216be75c7066465876fe1799683a90695ecb285f5a552050d0991"
    end
  end

  def install
    bin.install Dir["viper_*"].fetch(0) => "viper"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/viper version")
  end
end
