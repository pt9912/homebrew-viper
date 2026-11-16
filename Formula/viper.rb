# viper.rb — Homebrew formula skeleton. The release workflow (job `homebrew`) fills the marked
# placeholders from the SHA256SUMS of the same tag, attaches the result to the release as
# viper.rb and puts it into the tap pt9912/homebrew-viper. Four platforms: Homebrew has no Windows.
class Viper < Formula
  desc "Set up and use cloud machines for Claude Code"
  homepage "https://github.com/pt9912/hetzner-viper"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.32.0/viper_v0.32.0_darwin_arm64"
      sha256 "e2710180b8e1875989cdb31894c477b531cdc71afe7da01e69b56d824cbb22d9"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.32.0/viper_v0.32.0_darwin_amd64"
      sha256 "0a14505f3aca2bf2c9c455b9cd765b8c7f6c973005aa5b9f066c22a9c8e46b6e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.32.0/viper_v0.32.0_linux_arm64"
      sha256 "0c7379e0b9b70c427669855929713c8e723981f9f51f7dce99ac381a49e8486b"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.32.0/viper_v0.32.0_linux_amd64"
      sha256 "9ffed3074cd66bc390b37a380f18c753e58beca12d6f44afa1a582d8e695d897"
    end
  end

  def install
    bin.install Dir["viper_*"].fetch(0) => "viper"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/viper version")
  end
end
