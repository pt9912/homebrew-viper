# viper.rb — Homebrew formula skeleton. The release workflow (job `homebrew`) fills the marked
# placeholders from the SHA256SUMS of the same tag, attaches the result to the release as
# viper.rb and puts it into the tap pt9912/homebrew-viper. Four platforms: Homebrew has no Windows.
class Viper < Formula
  desc "Set up and use cloud machines for Claude Code"
  homepage "https://github.com/pt9912/hetzner-viper"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.28.0/viper_v0.28.0_darwin_arm64"
      sha256 "189c0a6e7c44abb246b605a40d50f1d4c4d39cdd5b6c3c47be2e8116bae6e339"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.28.0/viper_v0.28.0_darwin_amd64"
      sha256 "5cbc8ebe636d0e1fa2992d01f4b5177e7979a5af1f185f974d23b0fddbbf57c7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.28.0/viper_v0.28.0_linux_arm64"
      sha256 "1e34c6f06da64dce45b71b533889f14e23047982f893c0f6fa45c011a87457b2"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.28.0/viper_v0.28.0_linux_amd64"
      sha256 "39f6b12dfc3201f2b468e4ffaf9d3bfce5c214d9272240406af70a0e54dff3fc"
    end
  end

  def install
    bin.install Dir["viper_*"].fetch(0) => "viper"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/viper version")
  end
end
