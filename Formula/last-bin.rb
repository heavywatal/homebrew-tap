class LastBin < Formula
  desc "Auxiliary python scripts included in LAST repository"
  homepage "https://gitlab.com/mcfrith/last"
  url "https://gitlab.com/mcfrith/last/-/archive/1454/last-1454.tar.gz"
  sha256 "9a47330b38876ed9e4909004216be686bb6bc67fb301c103b5ef07cacd10dc7d"
  head "https://gitlab.com/mcfrith/last.git", branch: "master"

  def install
    bin.install Dir["bin/*"]
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/maf-convert -h")
  end
end
