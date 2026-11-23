class Notypo < Formula
  desc "Corrects typos in shell commands"
  homepage "https://github.com/notypo/notypo"
  license any_of: ["MIT", "Apache-2.0"]

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/notypo/notypo/releases/download/v0.1.2/notypo-macos-arm64.tar.gz"
      sha256 "300e3374ee9468c5d9da9e09b1bd3e97f16b2c2e6be4331b870b4cede0351699"
    else
      url "https://github.com/notypo/notypo/releases/download/v0.1.2/notypo-macos-x86_64.tar.gz"
      sha256 "70fbef0c5b3f9609fadf0e038a37d4a2a86cb4dfa85412c043ef3ac0b7e5efbf"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/notypo/notypo/releases/download/v0.1.2/notypo-linux-arm64.tar.gz"
      sha256 "e120c6c339c2aebdbbe5e299507ad6b574757b8e4547ecafa1341284c13ade5f"
    elsif Hardware::CPU.arm?
      url "https://github.com/notypo/notypo/releases/download/v0.1.2/notypo-linux-armv7.tar.gz"
      sha256 "8c5400a1f949279689e10280d6d9cf36f394e0da36630b1115a58ab93d6d72e7"
    else
      url "https://github.com/notypo/notypo/releases/download/v0.1.2/notypo-linux-x86_64.tar.gz"
      sha256 "a7b18421741eab665e52370bd5a8dd8d467ab00c6f69a01fe475ebbb5361c160"
    end
  end

  livecheck do
    url :homepage
    strategy :github_latest
  end

  def install
    bin.install "notypo"
  end

  def caveats
    <<~EOS
      `typo`, `fuck`, and `t` are shell functions, not separate binaries.
      Add this to ~/.zshrc or ~/.bashrc, then restart the shell:

        eval "$(notypo --alias)"

      Fish: notypo --alias | source
      PowerShell: Invoke-Expression ((notypo --alias) -join "`n")
    EOS
  end

  test do
    system bin/"notypo", "--version"
  end
end
