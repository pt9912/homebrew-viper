# viper.rb — Homebrew formula skeleton. The release workflow (job `homebrew`) fills the marked
# placeholders from the SHA256SUMS of the same tag, attaches the result to the release as
# viper.rb and puts it into the tap pt9912/homebrew-viper. Four platforms: Homebrew has no Windows.
class Viper < Formula
  desc "Set up and use cloud machines for Claude Code"
  homepage "https://github.com/pt9912/hetzner-viper"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.33.1/viper_v0.33.1_darwin_arm64"
      sha256 "263e04511cb16abcf5f0fb66782d0d8d04b778834c00b3d3835bb1eb161b0c14"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.33.1/viper_v0.33.1_darwin_amd64"
      sha256 "edc6eaf62a5519bb9efcf8a58565c8596f83addfcf34bc2f5291245f59d9c153"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.33.1/viper_v0.33.1_linux_arm64"
      sha256 "56796b627d295755a944632771b1516c6592378e6eed644e2048a01b99ea6805"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.33.1/viper_v0.33.1_linux_amd64"
      sha256 "4f036b20aa39042d90e84a3a564a0385c5a53f173f41a14a7b595e277b8fa427"
    end
  end

  def install
    bin.install Dir["viper_*"].fetch(0) => "viper"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/viper version")
  end
end
