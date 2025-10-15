class LastBin < Formula
  desc "Auxiliary python scripts included in LAST repository"
  homepage "https://gitlab.com/mcfrith/last"
  url "https://gitlab.com/mcfrith/last.git",
    tag:      "1648",
    revision: "5c0e6bb11cb36902ef485ae5b2f8b0550b9505c4"
  head "https://gitlab.com/mcfrith/last.git", branch: "main"

  def install
    bin.install Dir["bin/*"]
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/maf-convert -h")
  end
end
