# viper.rb — Homebrew formula skeleton. The release workflow (job `homebrew`) fills the marked
# placeholders from the SHA256SUMS of the same tag, attaches the result to the release as
# viper.rb and puts it into the tap pt9912/homebrew-viper. Four platforms: Homebrew has no Windows.
class Viper < Formula
  desc "Set up and use cloud machines for Claude Code"
  homepage "https://github.com/pt9912/hetzner-viper"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.19.0/viper_v0.19.0_darwin_arm64"
      sha256 "81801e792f3612c9ef378093bc622972a2976ed38766ec016d34ea8a24144e2d"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.19.0/viper_v0.19.0_darwin_amd64"
      sha256 "325a236fdaea7df1e6e3502769cd5618d31da07fb3df5adcfcc330e980051efd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.19.0/viper_v0.19.0_linux_arm64"
      sha256 "5e848e2627a20d647475c8bca0bb376fbb24e6bd16396eddf63688ca2e77f420"
    end
    on_intel do
      url "https://github.com/pt9912/hetzner-viper/releases/download/v0.19.0/viper_v0.19.0_linux_amd64"
      sha256 "dfdc2759553bc6085b9b79c08e854f696544e2735f66de0879b51097bacaeba8"
    end
  end

  def install
    bin.install Dir["viper_*"].fetch(0) => "viper"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/viper version")
  end
end
