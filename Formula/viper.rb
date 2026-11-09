# viper.rb — Homebrew formula skeleton. The release workflow (job `homebrew`) fills the marked
# placeholders from the SHA256SUMS of the same tag, attaches the result to the release as
# viper.rb and puts it into the tap pt9912/homebrew-viper. Four platforms: Homebrew has no Windows.
class Viper < Formula
  desc "Set up and use cloud machines for Claude Code"
  homepage "https://github.com/pt9912/hetzner-viper"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.15.1/viper_v0.15.1_darwin_arm64"
      sha256 "e0f1658385830989417caab5dccda442f43956d8dc21161ed7935a65a8532a7e"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.15.1/viper_v0.15.1_darwin_amd64"
      sha256 "b1dd439f7a64a42d05b018ad386408198f09e49ec7cb7e131120787311b3a623"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.15.1/viper_v0.15.1_linux_arm64"
      sha256 "a90187a2741f67e41a3e38bf6fa74aba511f714a884c3dafb25c5d3dd1946247"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.15.1/viper_v0.15.1_linux_amd64"
      sha256 "77a57672a5964063eeb128b6c9095e29286b5d44e41220a84fedaf9d2b7638e7"
    end
  end

  def install
    bin.install Dir["viper_*"].fetch(0) => "viper"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/viper version")
  end
end
