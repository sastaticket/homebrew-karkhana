# Written by karkhana's tap workflow (scripts/stamp-tap.py) from versions.env at karkhana-v1.0.0.
# Do not edit in the tap: the next GA overwrites it.
class KarkhanaDolt < Formula
  desc "dolt at the version the karkhana factory pins"
  homepage "https://github.com/dolthub/dolt"
  version "2.6.2"

  on_macos do
    on_arm do
      url "https://github.com/dolthub/dolt/releases/download/v2.6.2/dolt-darwin-arm64.tar.gz"
      sha256 "deb095a13f8b75a7c7f1fdb04eed8d8ffdd5602e327945e88523e598594ed3c6"
    end
    on_intel do
      url "https://github.com/dolthub/dolt/releases/download/v2.6.2/dolt-darwin-amd64.tar.gz"
      sha256 "1ad4313587b450a0de3d4f4fa8ebe3d606761c8969c51fb2b9697895e3a27c2f"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/dolthub/dolt/releases/download/v2.6.2/dolt-linux-arm64.tar.gz"
      sha256 "0004e5927f6eeff40493c0800fe7aa7bb73750305968e58eb024de48116eaad6"
    end
    on_intel do
      url "https://github.com/dolthub/dolt/releases/download/v2.6.2/dolt-linux-amd64.tar.gz"
      sha256 "e27a7957b8626946a5022fe0ad6ce4bfb3c8f51544c7f1372b0e6db14c1549cf"
    end
  end

  conflicts_with "dolt", because: "both install a dolt binary"

  def install
    bin.install "bin/dolt"
  end

  def caveats
    <<~EOS
      This dolt is pinned by karkhana. Upgrade it with its full name:
        brew upgrade sastaticket/karkhana/karkhana-dolt
      Homebrew core's dolt conflicts with it; do not install both.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dolt version")
  end
end
