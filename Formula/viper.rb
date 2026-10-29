# viper.rb — Homebrew formula skeleton. The release workflow (job `homebrew`) fills the marked
# placeholders from the SHA256SUMS of the same tag, attaches the result to the release as
# viper.rb and puts it into the tap pt9912/homebrew-viper. Four platforms: Homebrew has no Windows.
class Viper < Formula
  desc "Set up and use cloud machines for Claude Code"
  homepage "https://github.com/pt9912/hetzner-viper"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.13.0/viper_v0.13.0_darwin_arm64"
      sha256 "1a8cde403fed8e60a5ecb877e76036325260199a2d850b27a4bdc9620c728de0"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.13.0/viper_v0.13.0_darwin_amd64"
      sha256 "56f5e39f738354537ebef718600d308074dce7656ff2cf845acc7fd89a4351ab"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.13.0/viper_v0.13.0_linux_arm64"
      sha256 "201c22afb5b0d928a00902f7c10e7f0568cefac774706dcd3b58ba69c9901049"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.13.0/viper_v0.13.0_linux_amd64"
      sha256 "9d89fbe37b1a26489bb5d9c8d8fb941b242595bff9640c67e5d38358aeef6252"
    end
  end

  def install
    bin.install Dir["viper_*"].fetch(0) => "viper"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/viper version")
  end
end
