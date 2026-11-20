# viper.rb — Homebrew formula skeleton. The release workflow (job `homebrew`) fills the marked
# placeholders from the SHA256SUMS of the same tag, attaches the result to the release as
# viper.rb and puts it into the tap pt9912/homebrew-viper. Four platforms: Homebrew has no Windows.
class Viper < Formula
  desc "Set up and use cloud machines for Claude Code"
  homepage "https://github.com/pt9912/hetzner-viper"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.35.0/viper_v0.35.0_darwin_arm64"
      sha256 "1fc45224e7553e2ccd987c4d8e06c23f6973e6bccfb9df49ecf1980c7b995b4c"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.35.0/viper_v0.35.0_darwin_amd64"
      sha256 "fd67b4419e860f3761ec6608090ab8aceaf2a130b987072ae7e07853c007647e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.35.0/viper_v0.35.0_linux_arm64"
      sha256 "968852996302bf5b3593f71f80e2a16399e1bc3554b19310e05ea87032cc3c5a"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.35.0/viper_v0.35.0_linux_amd64"
      sha256 "65884ce6c6bf86e3f901f9d015c731cd6faa7efcd493842955c349860db4186f"
    end
  end

  def install
    bin.install Dir["viper_*"].fetch(0) => "viper"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/viper version")
  end
end
