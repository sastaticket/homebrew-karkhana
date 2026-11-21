# Written by karkhana's tap workflow (scripts/stamp-tap.py) from versions.env at karkhana-v3.0.0.
# Do not edit in the tap: the next GA overwrites it.
class KhSetup < Formula
  desc "One command from a fresh machine to the karkhana setup stage"
  homepage "https://github.com/sastaticket/homebrew-karkhana"
  url "https://raw.githubusercontent.com/sastaticket/homebrew-karkhana/main/dist/kh-setup-karkhana-v3.0.0.tar.gz"
  version "3.0.0"
  sha256 "80d3801a5dc2f71931f6c522dff6acdde4fee4e3e58c0a9183c2331cb35a7890"

  depends_on "sastaticket/karkhana/karkhana-bd"
  depends_on "sastaticket/karkhana/karkhana-dolt"
  depends_on "age"
  # The rest of what the setup stage needs, all from Homebrew core (ADR 040 decision 2): the one
  # command installs them, so nobody installs them by hand first. PyYAML is not a formula for
  # python@3.12: the setup stage installs it to that Python's user site.
  depends_on "gh"
  depends_on "python@3.12"
  depends_on "tmux"
  on_macos do
    depends_on "flock" # Linux has it in util-linux
  end

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
