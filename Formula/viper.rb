# viper.rb — Homebrew formula skeleton. The release workflow (job `homebrew`) fills the marked
# placeholders from the SHA256SUMS of the same tag, attaches the result to the release as
# viper.rb and puts it into the tap pt9912/homebrew-viper. Four platforms: Homebrew has no Windows.
class Viper < Formula
  desc "Set up and use cloud machines for Claude Code"
  homepage "https://github.com/pt9912/hetzner-viper"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.18.0/viper_v0.18.0_darwin_arm64"
      sha256 "d89d736bd134585b6fef8688cf46dbb2b1fb6e88fe3513ebd66722e552405294"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.18.0/viper_v0.18.0_darwin_amd64"
      sha256 "cca06cc8cd8da310861975e3f413cd6ade3b75ba176bf566f28a7a36af97a309"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.18.0/viper_v0.18.0_linux_arm64"
      sha256 "8328a305eaf0b48b1abfc2a86b2f4d8192e5b9b84f1afe1a3b5670de6617449c"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.18.0/viper_v0.18.0_linux_amd64"
      sha256 "5e66f6e9dc95ce29ee88831f257e8ea90bd68f4aa114933d556b4724db9e0467"
    end
  end

  def install
    bin.install Dir["viper_*"].fetch(0) => "viper"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/viper version")
  end
end
