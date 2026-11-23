class Notypo < Formula
  desc "Corrects typos in shell commands"
  homepage "https://github.com/notypo/notypo"
  license any_of: ["MIT", "Apache-2.0"]

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/notypo/notypo/releases/download/v0.1.3/notypo-macos-arm64.tar.gz"
      sha256 "89bf5382404fa90a761f39fc7228e1cdec530176bce9a7878ba3ddd94eae20d0"
    else
      url "https://github.com/notypo/notypo/releases/download/v0.1.3/notypo-macos-x86_64.tar.gz"
      sha256 "58fb71f580ffca9d4c278dee821206fca4a94d214a2a8d80acbce38f0d0e664b"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/notypo/notypo/releases/download/v0.1.3/notypo-linux-arm64.tar.gz"
      sha256 "0d740322b2e7a8412e1f5b5416081d8a9ce73674df1f74c3c0e05e26a72b72ad"
    elsif Hardware::CPU.arm?
      url "https://github.com/notypo/notypo/releases/download/v0.1.3/notypo-linux-armv7.tar.gz"
      sha256 "1d271eeca610cde568404bea93d9c600a5e7fe0a98244f0f439c28070d0193c1"
    else
      url "https://github.com/notypo/notypo/releases/download/v0.1.3/notypo-linux-x86_64.tar.gz"
      sha256 "47762b7f0a74c1bb3b5d2ae28ff4f3d57226cb39be1fc0be52f28fcb7035bc4c"
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
