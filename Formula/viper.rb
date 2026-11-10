# viper.rb — Homebrew formula skeleton. The release workflow (job `homebrew`) fills the marked
# placeholders from the SHA256SUMS of the same tag, attaches the result to the release as
# viper.rb and puts it into the tap pt9912/homebrew-viper. Four platforms: Homebrew has no Windows.
class Viper < Formula
  desc "Set up and use cloud machines for Claude Code"
  homepage "https://github.com/pt9912/hetzner-viper"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.16.0/viper_v0.16.0_darwin_arm64"
      sha256 "d34de1e1a50f1ef5d9db26dc7022995eaaa0de711de98616b7d99686472c19d5"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.16.0/viper_v0.16.0_darwin_amd64"
      sha256 "daa930603a3f92b4df699b5db82285b95e26750f83b9a50a71fc895916751946"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.16.0/viper_v0.16.0_linux_arm64"
      sha256 "e1bfe387b8f3443d5d3f337337882df0d067a4d1d2aebd4eb0e89a74f818eb1a"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.16.0/viper_v0.16.0_linux_amd64"
      sha256 "219f3ac2c71a5661b6ee206f758f7cdd0568a2dcde3983838c967255668ef240"
    end
  end

  def install
    bin.install Dir["viper_*"].fetch(0) => "viper"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/viper version")
  end
end
