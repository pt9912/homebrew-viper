# viper.rb — Homebrew formula skeleton. The release workflow (job `homebrew`) fills the marked
# placeholders from the SHA256SUMS of the same tag, attaches the result to the release as
# viper.rb and puts it into the tap pt9912/homebrew-viper. Four platforms: Homebrew has no Windows.
class Viper < Formula
  desc "Set up and use cloud machines for Claude Code"
  homepage "https://github.com/pt9912/hetzner-viper"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.29.0/viper_v0.29.0_darwin_arm64"
      sha256 "72e042267f5195876c7b1a83cf70d4ab2ba89708cdc6b6309ba082990c424664"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.29.0/viper_v0.29.0_darwin_amd64"
      sha256 "63f0ce3739da4ed3de20e8738a9b75972da40892a56ccadcdcabe9f8e637bef2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.29.0/viper_v0.29.0_linux_arm64"
      sha256 "e6db1ffd426d8877cbe7370bd6d2d21ab675d3a52f901a1ddf4d602e30caa4c0"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.29.0/viper_v0.29.0_linux_amd64"
      sha256 "fc284b1903b7f46eb5fef2207864d463a00aac9bc0d4faf6124141eeac843b81"
    end
  end

  def install
    bin.install Dir["viper_*"].fetch(0) => "viper"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/viper version")
  end
end
