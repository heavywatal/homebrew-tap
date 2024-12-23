class LastBin < Formula
  desc "Auxiliary python scripts included in LAST repository"
  homepage "https://gitlab.com/mcfrith/last"
  url "https://gitlab.com/mcfrith/last.git",
    tag:      "1607",
    revision: "48a46e42e534015a58953d6cf4332259d9dc50ea"
  head "https://gitlab.com/mcfrith/last.git", branch: "main"

  def install
    bin.install Dir["bin/*"]
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/maf-convert -h")
  end
end
