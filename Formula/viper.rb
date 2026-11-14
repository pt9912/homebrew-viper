# viper.rb — Homebrew formula skeleton. The release workflow (job `homebrew`) fills the marked
# placeholders from the SHA256SUMS of the same tag, attaches the result to the release as
# viper.rb and puts it into the tap pt9912/homebrew-viper. Four platforms: Homebrew has no Windows.
class Viper < Formula
  desc "Set up and use cloud machines for Claude Code"
  homepage "https://github.com/pt9912/hetzner-viper"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.25.0/viper_v0.25.0_darwin_arm64"
      sha256 "2706a8a10ae24093eb2271f2b2beebe023dfab01aeee42fc97e5d603adc9555c"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.25.0/viper_v0.25.0_darwin_amd64"
      sha256 "a5b39cbdec78b47ba3bda93c65978163eed18b90e930c740a9a2295582219a20"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.25.0/viper_v0.25.0_linux_arm64"
      sha256 "da5aeee0c678b693af8b3d7eeb2b506b6b44466b8c4664c2ae995accf6fb535d"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.25.0/viper_v0.25.0_linux_amd64"
      sha256 "fcd113fc457d0cecda4ef57e845900d5c2a4e4d5114e3716b8a218f7bd591421"
    end
  end

  def install
    bin.install Dir["viper_*"].fetch(0) => "viper"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/viper version")
  end
end
