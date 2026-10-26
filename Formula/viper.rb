# viper.rb — Homebrew formula skeleton. The release workflow (job `homebrew`) fills the marked
# placeholders from the SHA256SUMS of the same tag, attaches the result to the release as
# viper.rb and puts it into the tap pt9912/homebrew-viper. Four platforms: Homebrew has no Windows.
class Viper < Formula
  desc "Set up and use Hetzner machines for Claude Code"
  homepage "https://github.com/pt9912/hetzner-viper"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.6.0/viper_v0.6.0_darwin_arm64"
      sha256 "e37f8ac1babf8790a2d238dbccf454f8392aeea5c1532aed3afcc7b3b4b8f35d"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.6.0/viper_v0.6.0_darwin_amd64"
      sha256 "a20a0804d521556ac6a5a93ea45369df9178e784ac472124c9e780fff8a057e2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.6.0/viper_v0.6.0_linux_arm64"
      sha256 "7e56a3531513ed41e22c09044acf5b24feb4c9be24097f365ed6a0f6ed00bf63"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.6.0/viper_v0.6.0_linux_amd64"
      sha256 "b3237aa418571c8eb162831c2498314998d613d2aaf732fd3f356cf03b60f122"
    end
  end

  def install
    bin.install Dir["viper_*"].fetch(0) => "viper"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/viper version")
  end
end
