class LastBin < Formula
  desc "Auxiliary python scripts included in LAST repository"
  homepage "https://gitlab.com/mcfrith/last"
  url "https://gitlab.com/mcfrith/last/-/archive/1454/last-1454.tar.gz"
  sha256 "d1f3dcd6bf4d0e7cdecddbbed6645fb6def8abbc9a8b98a9aa14c3ebcabfc2a4"
  head "https://gitlab.com/mcfrith/last.git", branch: "master"

  def install
    bin.install Dir["bin/*"]
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/maf-convert -h")
  end
end
