class LastBin < Formula
  desc "Auxiliary python scripts included in LAST repository"
  homepage "https://gitlab.com/mcfrith/last"
  url "https://gitlab.com/mcfrith/last.git",
    tag:      "1542",
    revision: "3289552d7af13ba27b6dd81f59a160e7210896e1"
  head "https://gitlab.com/mcfrith/last.git", branch: "main"

  def install
    bin.install Dir["bin/*"]
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/maf-convert -h")
  end
end
