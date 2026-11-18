# viper.rb — Homebrew formula skeleton. The release workflow (job `homebrew`) fills the marked
# placeholders from the SHA256SUMS of the same tag, attaches the result to the release as
# viper.rb and puts it into the tap pt9912/homebrew-viper. Four platforms: Homebrew has no Windows.
class Viper < Formula
  desc "Set up and use cloud machines for Claude Code"
  homepage "https://github.com/pt9912/hetzner-viper"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.34.0/viper_v0.34.0_darwin_arm64"
      sha256 "4561e9e694f4f791dc55d1a91edb009c002d92b3d0633620a8c063d94917aa06"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.34.0/viper_v0.34.0_darwin_amd64"
      sha256 "575bba735ad5307da7d7ecc96a1ad0dcf2acace2b9b338e991c4176670376f20"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.34.0/viper_v0.34.0_linux_arm64"
      sha256 "2a5eff13bc20e0cfb1275121cd2bc675efbfd204090530e0d71fd6329b73da7d"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.34.0/viper_v0.34.0_linux_amd64"
      sha256 "2b0b0cdc3ea574d4d4f98041203fe7da628c2e4986478c499cd792e02e62fde8"
    end
  end

  def install
    bin.install Dir["viper_*"].fetch(0) => "viper"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/viper version")
  end
end
