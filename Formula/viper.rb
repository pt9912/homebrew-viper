# viper.rb — Homebrew formula skeleton. The release workflow (job `homebrew`) fills the marked
# placeholders from the SHA256SUMS of the same tag, attaches the result to the release as
# viper.rb and puts it into the tap pt9912/homebrew-viper. Four platforms: Homebrew has no Windows.
class Viper < Formula
  desc "Set up and use cloud machines for Claude Code"
  homepage "https://github.com/pt9912/hetzner-viper"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.27.1/viper_v0.27.1_darwin_arm64"
      sha256 "3a7378db2b026525b2217f6b58229230e758f66f556beed20b6bea26af6d3321"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.27.1/viper_v0.27.1_darwin_amd64"
      sha256 "1817ea9a1a62d8ab00c37304affcb9d9ca9621f3e0802c3fcc7d525e39848f46"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.27.1/viper_v0.27.1_linux_arm64"
      sha256 "df3184ce8f170fd4726c381cffc9775b469061a966db10d50e89e622689ddae7"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.27.1/viper_v0.27.1_linux_amd64"
      sha256 "c28c9b29973ebbaab6ae228eb67d957961078c9141f4ea1ff4a92b8e6d2ac15c"
    end
  end

  def install
    bin.install Dir["viper_*"].fetch(0) => "viper"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/viper version")
  end
end
