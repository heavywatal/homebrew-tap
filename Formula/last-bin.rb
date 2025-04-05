class LastBin < Formula
  desc "Auxiliary python scripts included in LAST repository"
  homepage "https://gitlab.com/mcfrith/last"
  url "https://gitlab.com/mcfrith/last.git",
    tag:      "1638",
    revision: "eaca96d2f70a7cb1e660010efd28d2858ef0e7fe"
  head "https://gitlab.com/mcfrith/last.git", branch: "main"

  def install
    bin.install Dir["bin/*"]
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/maf-convert -h")
  end
end
