# viper.rb — Homebrew formula skeleton. The release workflow (job `homebrew`) fills the marked
# placeholders from the SHA256SUMS of the same tag, attaches the result to the release as
# viper.rb and puts it into the tap pt9912/homebrew-viper. Four platforms: Homebrew has no Windows.
class Viper < Formula
  desc "Set up and use cloud machines for Claude Code"
  homepage "https://github.com/pt9912/hetzner-viper"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.20.0/viper_v0.20.0_darwin_arm64"
      sha256 "cf7c99ae4ac01759ceb8ecc9d75449b2b45fcde56b204e84b37e7bed32dc11aa"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.20.0/viper_v0.20.0_darwin_amd64"
      sha256 "8e924204db766f690d76e7b1a585aafb6af25f59179f4c23817c528e3f4682a9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.20.0/viper_v0.20.0_linux_arm64"
      sha256 "d085144b51e85ca2ab12566e04779112a6a0cfcbd85bdfede6df0ea964662d77"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.20.0/viper_v0.20.0_linux_amd64"
      sha256 "e77bf0290ce74013e698ac034d63c19d5ca8e402ac391430a0503d8081e1ce1d"
    end
  end

  def install
    bin.install Dir["viper_*"].fetch(0) => "viper"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/viper version")
  end
end
