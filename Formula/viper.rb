# viper.rb — Homebrew formula skeleton. The release workflow (job `homebrew`) fills the marked
# placeholders from the SHA256SUMS of the same tag, attaches the result to the release as
# viper.rb and puts it into the tap pt9912/homebrew-viper. Four platforms: Homebrew has no Windows.
class Viper < Formula
  desc "Set up and use cloud machines for Claude Code"
  homepage "https://github.com/pt9912/hetzner-viper"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.9.0/viper_v0.9.0_darwin_arm64"
      sha256 "75facf49dd15f1e48f23d70d5adb4da52631a45959bc4d280af25e0362287bed"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.9.0/viper_v0.9.0_darwin_amd64"
      sha256 "13a4c81d17cc17ca4d1e6c63133b782c4d1c5792acf75e5b4ddf773fe5c24de4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.9.0/viper_v0.9.0_linux_arm64"
      sha256 "4da3134cfc46458be9a724f0af4aa807ccc092b108caef23107b1a6e1d58922b"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.9.0/viper_v0.9.0_linux_amd64"
      sha256 "6b73ea2f003fe9cdb815165cac34155f10e1fcbcbbe5f47b7c7d0e674eb3f650"
    end
  end

  def install
    bin.install Dir["viper_*"].fetch(0) => "viper"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/viper version")
  end
end
