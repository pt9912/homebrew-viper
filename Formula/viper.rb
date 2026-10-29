# viper.rb — Homebrew formula skeleton. The release workflow (job `homebrew`) fills the marked
# placeholders from the SHA256SUMS of the same tag, attaches the result to the release as
# viper.rb and puts it into the tap pt9912/homebrew-viper. Four platforms: Homebrew has no Windows.
class Viper < Formula
  desc "Set up and use cloud machines for Claude Code"
  homepage "https://github.com/pt9912/hetzner-viper"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.11.0/viper_v0.11.0_darwin_arm64"
      sha256 "8f2f2895973db0cf1e39cfb2e8dcd05ac690c7e78c5f003081695fcf400fac36"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.11.0/viper_v0.11.0_darwin_amd64"
      sha256 "432a1c936ec18304a7e0cab1ceec5da63cc6dbe8f2473e8300329dce885c594d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.11.0/viper_v0.11.0_linux_arm64"
      sha256 "a2cc136a8a0d54d4ba6e798dc9950c3d8bd353d7f43ee4ece1a8ba5750c8a392"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.11.0/viper_v0.11.0_linux_amd64"
      sha256 "b7be10e384b70ddd5b3ed3d383908b6bb8ada981db64fa670461b48b3434fbf3"
    end
  end

  def install
    bin.install Dir["viper_*"].fetch(0) => "viper"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/viper version")
  end
end
