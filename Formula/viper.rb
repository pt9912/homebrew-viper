# viper.rb — Homebrew formula skeleton. The release workflow (job `homebrew`) fills the marked
# placeholders from the SHA256SUMS of the same tag, attaches the result to the release as
# viper.rb and puts it into the tap pt9912/homebrew-viper. Four platforms: Homebrew has no Windows.
class Viper < Formula
  desc "Set up and use cloud machines for Claude Code"
  homepage "https://github.com/pt9912/hetzner-viper"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.34.3/viper_v0.34.3_darwin_arm64"
      sha256 "cb217f326267751dbded499c5fa37d927f80158298cec1411dfd655756f17655"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.34.3/viper_v0.34.3_darwin_amd64"
      sha256 "79ca638ad65a46d77ee25bc6db1f8915d37e7f5ee3d3847d3366a9c44ba6c85c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.34.3/viper_v0.34.3_linux_arm64"
      sha256 "652da0120c89fa12ba0592d9c80ac26acd28df97ca6db5e0005f654d07acf96b"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.34.3/viper_v0.34.3_linux_amd64"
      sha256 "948242fb30f21f77355fd67ac713c9e7639dc2da01d4ab254299a0de0cef3ae8"
    end
  end

  def install
    bin.install Dir["viper_*"].fetch(0) => "viper"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/viper version")
  end
end
