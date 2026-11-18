# viper.rb — Homebrew formula skeleton. The release workflow (job `homebrew`) fills the marked
# placeholders from the SHA256SUMS of the same tag, attaches the result to the release as
# viper.rb and puts it into the tap pt9912/homebrew-viper. Four platforms: Homebrew has no Windows.
class Viper < Formula
  desc "Set up and use cloud machines for Claude Code"
  homepage "https://github.com/pt9912/hetzner-viper"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.34.1/viper_v0.34.1_darwin_arm64"
      sha256 "6ef1e4b4991890fad56a978468c4f82f72baa056bfd531af1a4d560820f259b9"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.34.1/viper_v0.34.1_darwin_amd64"
      sha256 "90ee721c637ff908103459f52bc1cd105d24f54ebd53a29aef1c098f14fd9946"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.34.1/viper_v0.34.1_linux_arm64"
      sha256 "ecc5afc5b55469574ab4314ad536702b60203b7dd5c41186abda5771404d28f8"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.34.1/viper_v0.34.1_linux_amd64"
      sha256 "55bb4fc998875b64b64a1a7bee72bc2a0f319df4c72116567213559bd27b9df8"
    end
  end

  def install
    bin.install Dir["viper_*"].fetch(0) => "viper"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/viper version")
  end
end
