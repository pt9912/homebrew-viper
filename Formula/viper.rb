# viper.rb — Homebrew formula skeleton. The release workflow (job `homebrew`) fills the marked
# placeholders from the SHA256SUMS of the same tag, attaches the result to the release as
# viper.rb and puts it into the tap pt9912/homebrew-viper. Four platforms: Homebrew has no Windows.
class Viper < Formula
  desc "Set up and use cloud machines for Claude Code"
  homepage "https://github.com/pt9912/hetzner-viper"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.14.0/viper_v0.14.0_darwin_arm64"
      sha256 "9ac325b853ea67aae4014b26979014d0dd057befaf237b58fbfac417234f524b"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.14.0/viper_v0.14.0_darwin_amd64"
      sha256 "4b2243a92ddcfa6f33333915de2586179f26d0c3d54264863e6d488203f60ed4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.14.0/viper_v0.14.0_linux_arm64"
      sha256 "527cd49cca589811e88f4919c01fa33bb25e0b01e091aac104c38c8e0f69a751"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.14.0/viper_v0.14.0_linux_amd64"
      sha256 "8f574504b51f0be8cee79519db19e121277e4d4675bb1f7a535fffb077a47a63"
    end
  end

  def install
    bin.install Dir["viper_*"].fetch(0) => "viper"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/viper version")
  end
end
