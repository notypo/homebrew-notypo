class Notypo < Formula
  desc "Corrects typos in shell commands"
  homepage "https://github.com/notypo/notypo"
  license any_of: ["MIT", "Apache-2.0"]

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/notypo/notypo/releases/download/v0.1.0/notypo-macos-arm64.tar.gz"
      sha256 "3635ed2c3b265d63395fe3db4fb56ca390ef60a8392d81196cfaf61ebf7b9943"
    else
      url "https://github.com/notypo/notypo/releases/download/v0.1.0/notypo-macos-x86_64.tar.gz"
      sha256 "07ec588fc4e432dcf8e8f217f340b484494222bee8815f2a636f9a0ab6d0cb8c"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/notypo/notypo/releases/download/v0.1.0/notypo-linux-arm64.tar.gz"
      sha256 "7c11119498df28b0ae7786bf84c398cc1a21686fb790a7570e18b7ce4e5fadca"
    elsif Hardware::CPU.arm?
      url "https://github.com/notypo/notypo/releases/download/v0.1.0/notypo-linux-armv7.tar.gz"
      sha256 "d1dd26f7afb6d499e224b4e05b0570cc81a835e74760c082db4f04ef1c1051a0"
    else
      url "https://github.com/notypo/notypo/releases/download/v0.1.0/notypo-linux-x86_64.tar.gz"
      sha256 "b3cf67dd151f43d5001e209d41f98d109004b6eeb4e63f259ee53232f321fe00"
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
