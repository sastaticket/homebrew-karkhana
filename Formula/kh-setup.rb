# Written by karkhana's tap workflow (scripts/stamp-tap.py) from versions.env at karkhana-v1.0.0.
# Do not edit in the tap: the next GA overwrites it.
class KhSetup < Formula
  desc "One command from a fresh machine to the karkhana setup stage"
  homepage "https://github.com/sastaticket/homebrew-karkhana"
  url "https://raw.githubusercontent.com/sastaticket/homebrew-karkhana/main/dist/kh-setup-karkhana-v1.0.0.tar.gz"
  version "1.0.0"
  sha256 "73de14677cdeebb6e08a53483591f9aafe84b80acc4b8d54b290e00e5c4ca63f"

  depends_on "sastaticket/karkhana/karkhana-bd"
  depends_on "sastaticket/karkhana/karkhana-dolt"

  def install
    bin.install "kh-setup"
    (share/"kh-setup").install "pins.env"
  end

  def caveats
    <<~EOS
      Run kh-setup to set up this machine. Upgrade with the full name:
        brew upgrade sastaticket/karkhana/kh-setup
      Homebrew does not install the city engine gc: the setup stage installs it
      with make upgrade-gc, and make upgrade-gc alone moves it.
    EOS
  end

  test do
    assert_path_exists share/"kh-setup/pins.env"
  end
end
