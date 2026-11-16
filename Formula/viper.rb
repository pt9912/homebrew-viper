# viper.rb — Homebrew formula skeleton. The release workflow (job `homebrew`) fills the marked
# placeholders from the SHA256SUMS of the same tag, attaches the result to the release as
# viper.rb and puts it into the tap pt9912/homebrew-viper. Four platforms: Homebrew has no Windows.
class Viper < Formula
  desc "Set up and use cloud machines for Claude Code"
  homepage "https://github.com/pt9912/hetzner-viper"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.31.0/viper_v0.31.0_darwin_arm64"
      sha256 "f898d54cb2c7df46cae5d3e53aa87a3855d387d751555d1b26dfa3693146a0a3"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.31.0/viper_v0.31.0_darwin_amd64"
      sha256 "4a8586c300a74fbf1388cb332c8b4422e1d5fdfd07602a35d1f55b5088d7eb9c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.31.0/viper_v0.31.0_linux_arm64"
      sha256 "b824aab38bb9e4b8148189f348a226ae6ee23d34138ea6727bc3d5cbfde1db98"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.31.0/viper_v0.31.0_linux_amd64"
      sha256 "3c14bcd42cfc13867443167c170c22c9872cf4bfc4785d5cb289a3f3f0bc3bd1"
    end
  end

  def install
    bin.install Dir["viper_*"].fetch(0) => "viper"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/viper version")
  end
end
