# viper.rb — Homebrew formula skeleton. The release workflow (job `homebrew`) fills the marked
# placeholders from the SHA256SUMS of the same tag, attaches the result to the release as
# viper.rb and puts it into the tap pt9912/homebrew-viper. Four platforms: Homebrew has no Windows.
class Viper < Formula
  desc "Set up and use cloud machines for Claude Code"
  homepage "https://github.com/pt9912/hetzner-viper"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.34.2/viper_v0.34.2_darwin_arm64"
      sha256 "aae38caa67eeaf461aabf9c9550e3101e0f9797408e4d1ff510ebb6e37d2421e"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.34.2/viper_v0.34.2_darwin_amd64"
      sha256 "bc6eaa161af1df42be860a8488e719a7c745e876d233ac2da1de972bc670ed6d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.34.2/viper_v0.34.2_linux_arm64"
      sha256 "65325ecd65930eb4ad7aa259db38c235880a4dc6cca5b4a8ecf9de29ad9b6f0d"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.34.2/viper_v0.34.2_linux_amd64"
      sha256 "434c795c73b02d614b46cc99d9b1c25626b4783eb25cc57c7044fe991150793e"
    end
  end

  def install
    bin.install Dir["viper_*"].fetch(0) => "viper"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/viper version")
  end
end
