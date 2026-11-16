# viper.rb — Homebrew formula skeleton. The release workflow (job `homebrew`) fills the marked
# placeholders from the SHA256SUMS of the same tag, attaches the result to the release as
# viper.rb and puts it into the tap pt9912/homebrew-viper. Four platforms: Homebrew has no Windows.
class Viper < Formula
  desc "Set up and use cloud machines for Claude Code"
  homepage "https://github.com/pt9912/hetzner-viper"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.30.0/viper_v0.30.0_darwin_arm64"
      sha256 "3fe695e37146ce75acabf2db980a6ccc6f9afb4d7e50b8da1628cdc45d0c3a44"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.30.0/viper_v0.30.0_darwin_amd64"
      sha256 "d9ca57d29ed635de0441bc29f556d6966f4d68ca467226b2845811459589caf9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.30.0/viper_v0.30.0_linux_arm64"
      sha256 "1b7342ecccb4afebd0ab079bffe06371b9c4ae7cf1882dde4fb8f1dddb71846d"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.30.0/viper_v0.30.0_linux_amd64"
      sha256 "8f70f1e2c126b94be8bcd225206809e27bf8071a08cefac9d380f98f6c1ec6a8"
    end
  end

  def install
    bin.install Dir["viper_*"].fetch(0) => "viper"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/viper version")
  end
end
