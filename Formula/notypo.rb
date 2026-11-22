class Notypo < Formula
  desc "Corrects typos in shell commands"
  homepage "https://github.com/notypo/notypo"
  license any_of: ["MIT", "Apache-2.0"]

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/notypo/notypo/releases/download/v0.1.1/notypo-macos-arm64.tar.gz"
      sha256 "6813546e0898e77cac1a9e3dffe8b4424269e3e867cd685058d55618623080d8"
    else
      url "https://github.com/notypo/notypo/releases/download/v0.1.1/notypo-macos-x86_64.tar.gz"
      sha256 "4b77717802626a989ba19e50cb3319591e704a4df732cbc604394f3b018df9fd"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/notypo/notypo/releases/download/v0.1.1/notypo-linux-arm64.tar.gz"
      sha256 "f0517ef62a0fc693b9c76dd81b8607970c1a8b57653754f6d4672797d11ddfb1"
    elsif Hardware::CPU.arm?
      url "https://github.com/notypo/notypo/releases/download/v0.1.1/notypo-linux-armv7.tar.gz"
      sha256 "15e91d15c1bd3673fa535f25517527bcbe17328d8206fc6b1fce5cd7c3cb2752"
    else
      url "https://github.com/notypo/notypo/releases/download/v0.1.1/notypo-linux-x86_64.tar.gz"
      sha256 "64a89cec601925a42842c8cf382b5f1476877bf2eb04860c5a087aa991b54c62"
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
