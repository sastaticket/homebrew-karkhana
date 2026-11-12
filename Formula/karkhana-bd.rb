# Written by karkhana's tap workflow (scripts/stamp-tap.py) from versions.env at karkhana-v1.0.0.
# Do not edit in the tap: the next GA overwrites it.
class KarkhanaBd < Formula
  desc "bd (beads) at the version the karkhana factory pins"
  homepage "https://github.com/gastownhall/beads"
  version "1.3.3"

  on_macos do
    on_arm do
      url "https://github.com/gastownhall/beads/releases/download/v1.3.3/beads_1.3.3_darwin_arm64.tar.gz"
      sha256 "dff94fd00ae921fe3f84d4750847e4126b5844bc868c253c45b391f112ff60aa"
    end
    on_intel do
      url "https://github.com/gastownhall/beads/releases/download/v1.3.3/beads_1.3.3_darwin_amd64.tar.gz"
      sha256 "650808fc8efef9931ded0fd83de49f15d7588611638e1698309d87173af794ca"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/gastownhall/beads/releases/download/v1.3.3/beads_1.3.3_linux_arm64.tar.gz"
      sha256 "7cbaeff861ed5f8b336ae94e4c22342363df8ade113f95f95098940da9bd808c"
    end
    on_intel do
      url "https://github.com/gastownhall/beads/releases/download/v1.3.3/beads_1.3.3_linux_amd64.tar.gz"
      sha256 "10a7aebfd50549c33c43d185e3870bbd82b4f900b2a5e3129369ee6e2b0fb2e5"
    end
  end

  conflicts_with "beads", because: "both install a bd binary"

  def install
    bin.install "bd"
  end

  def caveats
    <<~EOS
      This bd is pinned by karkhana. Upgrade it with its full name:
        brew upgrade sastaticket/karkhana/karkhana-bd
      Homebrew core's beads conflicts with it; do not install both.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bd version")
  end
end
