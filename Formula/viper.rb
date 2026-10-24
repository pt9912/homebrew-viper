# viper.rb — Homebrew formula skeleton. The release workflow (job `homebrew`) fills the marked
# placeholders from the SHA256SUMS of the same tag, attaches the result to the release as
# viper.rb and puts it into the tap pt9912/homebrew-viper. Four platforms: Homebrew has no Windows.
class Viper < Formula
  desc "Set up and use Hetzner machines for Claude Code"
  homepage "https://github.com/pt9912/hetzner-viper"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.5.2/viper_v0.5.2_darwin_arm64"
      sha256 "1bf9e0a15691f5b35acc6e62a917eaef804884538d2b2c0abaaf7606a8d6b73a"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.5.2/viper_v0.5.2_darwin_amd64"
      sha256 "eb080cc5889570b8f0ad99bd1da069ca82adeb46a9dfc6a1bf9f44ac3b0c9e2a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.5.2/viper_v0.5.2_linux_arm64"
      sha256 "dc8863693861bf8f67ac036fa61fb8ff30ed0f8161d115d5a2ded09953f151f5"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.5.2/viper_v0.5.2_linux_amd64"
      sha256 "b6990422c9335ceddf7908a5c2a7796d9bcceb20133350da3c3b61475145d187"
    end
  end

  def install
    bin.install Dir["viper_*"].fetch(0) => "viper"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/viper version")
  end
end
