# viper.rb — Homebrew formula skeleton. The release workflow (job `homebrew`) fills the marked
# placeholders from the SHA256SUMS of the same tag, attaches the result to the release as
# viper.rb and puts it into the tap pt9912/homebrew-viper. Four platforms: Homebrew has no Windows.
class Viper < Formula
  desc "Set up and use cloud machines for Claude Code"
  homepage "https://github.com/pt9912/hetzner-viper"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.22.0/viper_v0.22.0_darwin_arm64"
      sha256 "5dbdb9bfde937b8f143b844d2d4466ffd3249e36f1c24982076063453b34b954"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.22.0/viper_v0.22.0_darwin_amd64"
      sha256 "587d7f2c8979ec1de282706600b87aa1bb52195fd2b03ed6ff6518cab4f56da5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.22.0/viper_v0.22.0_linux_arm64"
      sha256 "79b5d9e9f093419bf28bd29b45579ca01d6fce76ecdd861f051769a0b06ca480"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.22.0/viper_v0.22.0_linux_amd64"
      sha256 "dab2ac765477db610b97340bb2ee7d93a011d92082b926530ff4b86339062232"
    end
  end

  def install
    bin.install Dir["viper_*"].fetch(0) => "viper"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/viper version")
  end
end
