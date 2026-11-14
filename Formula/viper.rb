# viper.rb — Homebrew formula skeleton. The release workflow (job `homebrew`) fills the marked
# placeholders from the SHA256SUMS of the same tag, attaches the result to the release as
# viper.rb and puts it into the tap pt9912/homebrew-viper. Four platforms: Homebrew has no Windows.
class Viper < Formula
  desc "Set up and use cloud machines for Claude Code"
  homepage "https://github.com/pt9912/hetzner-viper"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.24.0/viper_v0.24.0_darwin_arm64"
      sha256 "78656e9cad61397bf48c9cdb055021dd4aebb9505ff686007a4a972799e518f5"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.24.0/viper_v0.24.0_darwin_amd64"
      sha256 "7f3560a9d50d83d3067498010eaa465c988d31b4ea269bd985d4d2625935cb85"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.24.0/viper_v0.24.0_linux_arm64"
      sha256 "12e9ebb670a604e5a547cbb30ece7cc8c6cead04c09f727d243b2734061b25c6"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.24.0/viper_v0.24.0_linux_amd64"
      sha256 "8a9388ee6cccb15e7ea8be6b2a199b12fee8a8b6741d90b1a9f20a0ed4e78280"
    end
  end

  def install
    bin.install Dir["viper_*"].fetch(0) => "viper"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/viper version")
  end
end
