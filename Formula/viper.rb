# viper.rb — Homebrew formula skeleton. The release workflow (job `homebrew`) fills the marked
# placeholders from the SHA256SUMS of the same tag, attaches the result to the release as
# viper.rb and puts it into the tap pt9912/homebrew-viper. Four platforms: Homebrew has no Windows.
class Viper < Formula
  desc "Set up and use cloud machines for Claude Code"
  homepage "https://github.com/pt9912/hetzner-viper"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.17.0/viper_v0.17.0_darwin_arm64"
      sha256 "d23926ad285dc3efce52b52c4e44cb9b543ee54dd332f2269f51faa70858b4aa"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.17.0/viper_v0.17.0_darwin_amd64"
      sha256 "b7d36d0cc105a38636619aa80f5efb2490b1e7d3976012f5467d0f1ec22639ef"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.17.0/viper_v0.17.0_linux_arm64"
      sha256 "1783361d66b10315d9458b1c1f60a651b26484fedcfab52c94f77f6febe5be90"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.17.0/viper_v0.17.0_linux_amd64"
      sha256 "c3720fc8d30912696018f1127cfc1399be0b98cb53348237a64ac88e482b5c8c"
    end
  end

  def install
    bin.install Dir["viper_*"].fetch(0) => "viper"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/viper version")
  end
end
