class LastBin < Formula
  desc "Auxiliary python scripts included in LAST repository"
  homepage "https://gitlab.com/mcfrith/last"
  url "https://gitlab.com/mcfrith/last/-/archive/1519/last-1519.tar.gz"
  sha256 "d2408c45560dad37f6761c9e9f9a8b3cfccceb4783177362bc4d45bcdecec923"
  head "https://gitlab.com/mcfrith/last.git", branch: "master"

  def install
    bin.install Dir["bin/*"]
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/maf-convert -h")
  end
end
