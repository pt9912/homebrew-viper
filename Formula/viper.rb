# viper.rb — Homebrew formula skeleton. The release workflow (job `homebrew`) fills the marked
# placeholders from the SHA256SUMS of the same tag, attaches the result to the release as
# viper.rb and puts it into the tap pt9912/homebrew-viper. Four platforms: Homebrew has no Windows.
class Viper < Formula
  desc "Set up and use cloud machines for Claude Code"
  homepage "https://github.com/pt9912/hetzner-viper"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.21.1/viper_v0.21.1_darwin_arm64"
      sha256 "a88667e6daab90ae18eddea6c1945013db2f9513ba5715d945904bfeeb02592d"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.21.1/viper_v0.21.1_darwin_amd64"
      sha256 "e5aa9d4008b2fc1e57335f107ff55402d091211478c87c14609e488fa96033c5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.21.1/viper_v0.21.1_linux_arm64"
      sha256 "0e9b48b4c291a4daf24c28e62b3f0a140734a63ce59cdfb19bd8e35ea656351f"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.21.1/viper_v0.21.1_linux_amd64"
      sha256 "455ddff4234a575d61531501e2ba8acd07ef6c27fad6f2e19318795b06308a3b"
    end
  end

  def install
    bin.install Dir["viper_*"].fetch(0) => "viper"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/viper version")
  end
end
