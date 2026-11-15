# viper.rb — Homebrew formula skeleton. The release workflow (job `homebrew`) fills the marked
# placeholders from the SHA256SUMS of the same tag, attaches the result to the release as
# viper.rb and puts it into the tap pt9912/homebrew-viper. Four platforms: Homebrew has no Windows.
class Viper < Formula
  desc "Set up and use cloud machines for Claude Code"
  homepage "https://github.com/pt9912/hetzner-viper"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.27.0/viper_v0.27.0_darwin_arm64"
      sha256 "ce99f32f24188e1245ceb2f425c4eaa36564d788683893a10d13d84cd5952c24"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.27.0/viper_v0.27.0_darwin_amd64"
      sha256 "44a8712e236587eb9a170350801326426d322b7c7b10c1c566ca903d08949e64"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.27.0/viper_v0.27.0_linux_arm64"
      sha256 "6071fb94b9594954236c0db0aa62422777e56e283f706ccf77e7cd6fe79265c2"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.27.0/viper_v0.27.0_linux_amd64"
      sha256 "dae2b2cdd6024e8fb4bb2392c13dfab63a450faded0de61d4877138e80d5e39a"
    end
  end

  def install
    bin.install Dir["viper_*"].fetch(0) => "viper"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/viper version")
  end
end
