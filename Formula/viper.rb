# viper.rb — Homebrew formula skeleton. The release workflow (job `homebrew`) fills the marked
# placeholders from the SHA256SUMS of the same tag, attaches the result to the release as
# viper.rb and puts it into the tap pt9912/homebrew-viper. Four platforms: Homebrew has no Windows.
class Viper < Formula
  desc "Set up and use cloud machines for Claude Code"
  homepage "https://github.com/pt9912/hetzner-viper"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.23.0/viper_v0.23.0_darwin_arm64"
      sha256 "90bc3177a899b2b67e57f32c14ce0e5805b199457acc810bf00b691476691be7"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.23.0/viper_v0.23.0_darwin_amd64"
      sha256 "6876d9541883226e8eb7209d3871771a049e29d91d76c55a83a11a1e501e22a7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.23.0/viper_v0.23.0_linux_arm64"
      sha256 "bea0fdd186578c78ed6361d38fe4af73d0a24834c34caa3624bfc819e4f01dd2"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.23.0/viper_v0.23.0_linux_amd64"
      sha256 "b50b8865b73dd012f7a9e842979d7ef2c88c5cacbd02a54d0826d32639bbbf94"
    end
  end

  def install
    bin.install Dir["viper_*"].fetch(0) => "viper"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/viper version")
  end
end
