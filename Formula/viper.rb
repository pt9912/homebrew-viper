# viper.rb — Homebrew formula skeleton. The release workflow (job `homebrew`) fills the marked
# placeholders from the SHA256SUMS of the same tag, attaches the result to the release as
# viper.rb and puts it into the tap pt9912/homebrew-viper. Four platforms: Homebrew has no Windows.
class Viper < Formula
  desc "Set up and use cloud machines for Claude Code"
  homepage "https://github.com/pt9912/hetzner-viper"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.8.0/viper_v0.8.0_darwin_arm64"
      sha256 "9a2a9d1e798005a93b8c972d9e7dfc50dc0ae07b54d23e012ba2b931ae903592"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.8.0/viper_v0.8.0_darwin_amd64"
      sha256 "e8048577879bb3b137679f35e9119b86d017b2873b4beeec9f7e3a2fe624a39c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.8.0/viper_v0.8.0_linux_arm64"
      sha256 "870d3d248861ed6274a4d974f033e88a94ebe7645ea4ab5b8eb73a65e1c1a594"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.8.0/viper_v0.8.0_linux_amd64"
      sha256 "60e5a9e103e562b2e29fb58e1bd2ac7e0c4a24d031be58c0672ce9d04444bda4"
    end
  end

  def install
    bin.install Dir["viper_*"].fetch(0) => "viper"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/viper version")
  end
end
