class LastBin < Formula
  desc "Auxiliary python scripts included in LAST repository"
  homepage "https://gitlab.com/mcfrith/last"
  url "https://gitlab.com/mcfrith/last.git",
    tag:      "1608",
    revision: "07a5d4e2268d6f372aaf636058db5b37876b2068"
  head "https://gitlab.com/mcfrith/last.git", branch: "main"

  def install
    bin.install Dir["bin/*"]
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/maf-convert -h")
  end
end
