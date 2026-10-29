# viper.rb — Homebrew formula skeleton. The release workflow (job `homebrew`) fills the marked
# placeholders from the SHA256SUMS of the same tag, attaches the result to the release as
# viper.rb and puts it into the tap pt9912/homebrew-viper. Four platforms: Homebrew has no Windows.
class Viper < Formula
  desc "Set up and use cloud machines for Claude Code"
  homepage "https://github.com/pt9912/hetzner-viper"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.10.0/viper_v0.10.0_darwin_arm64"
      sha256 "a8293d4795182af66d1595fdca1fb47025b44728a153ac1b92b016045021d91a"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.10.0/viper_v0.10.0_darwin_amd64"
      sha256 "0c15a33c42d1f1d5b9489906fc2e6980ba15b0ad1387b39dfc5223403bb134bc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.10.0/viper_v0.10.0_linux_arm64"
      sha256 "2fbee22965f4a5f8a39ae8d4fdfbc544907fb852da7121449fdde4c6e3a1eb01"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.10.0/viper_v0.10.0_linux_amd64"
      sha256 "9510599d8da4a7a66980364f5ec692a809aad07f36be311d7a58c82deff2bdf6"
    end
  end

  def install
    bin.install Dir["viper_*"].fetch(0) => "viper"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/viper version")
  end
end
