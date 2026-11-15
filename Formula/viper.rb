# viper.rb — Homebrew formula skeleton. The release workflow (job `homebrew`) fills the marked
# placeholders from the SHA256SUMS of the same tag, attaches the result to the release as
# viper.rb and puts it into the tap pt9912/homebrew-viper. Four platforms: Homebrew has no Windows.
class Viper < Formula
  desc "Set up and use cloud machines for Claude Code"
  homepage "https://github.com/pt9912/hetzner-viper"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.26.1/viper_v0.26.1_darwin_arm64"
      sha256 "84e4b21cc4f71305fcc0c8cc5e2ed05261e69f51bd9ceffc0c810a0e58fec3c9"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.26.1/viper_v0.26.1_darwin_amd64"
      sha256 "9a91962f440334e07e7e22f16a32df2315be1a539cbf716bd0efe6465aa6077b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.26.1/viper_v0.26.1_linux_arm64"
      sha256 "e2e857519ebcc285f7087bd101daa8256a8b9eb92bc8f219f7e6bb1bb50c16ca"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.26.1/viper_v0.26.1_linux_amd64"
      sha256 "8f41d5abf76a60a74be4672f9e5dfeea0a470a4da8f03fe0a24aa5bba889bd0a"
    end
  end

  def install
    bin.install Dir["viper_*"].fetch(0) => "viper"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/viper version")
  end
end
