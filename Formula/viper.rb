# viper.rb — Homebrew formula skeleton. The release workflow (job `homebrew`) fills the marked
# placeholders from the SHA256SUMS of the same tag, attaches the result to the release as
# viper.rb and puts it into the tap pt9912/homebrew-viper. Four platforms: Homebrew has no Windows.
class Viper < Formula
  desc "Set up and use cloud machines for Claude Code"
  homepage "https://github.com/pt9912/hetzner-viper"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.35.1/viper_v0.35.1_darwin_arm64"
      sha256 "59d3e2b0403aa050c85aa562b67d05cc2c25a435b8d0ac196b6a0f593c919785"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.35.1/viper_v0.35.1_darwin_amd64"
      sha256 "678fe70b6a597f24dacbcb30d1b4cd2dc5772bab76e3c5a642eab0c9279dcf8e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.35.1/viper_v0.35.1_linux_arm64"
      sha256 "edc4c08fc02e5b036f548ce9bda7572d7a85d8ad72bf7d3d9a1591b8e1c324c1"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.35.1/viper_v0.35.1_linux_amd64"
      sha256 "8c427a6f254a8c2557abf7aec8b958d68a8b78f05eb345e40faff6fd5f2845bf"
    end
  end

  def install
    bin.install Dir["viper_*"].fetch(0) => "viper"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/viper version")
  end
end
