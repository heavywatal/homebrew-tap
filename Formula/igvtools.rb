class Igvtools < Formula
  desc "Interactive Genomics Viewer"
  homepage "https://www.broadinstitute.org/software/igv"
  url "https://data.broadinstitute.org/igv/projects/downloads/2.11/IGV_2.11.1.zip"
  sha256 "71e9dc22d161b1747262a77c5053a224e2d279b2bbe4a0bdd64ab3a095fc88c7"

  livecheck do
    url "https://software.broadinstitute.org/software/igv/download"
    regex(/href=.*?IGV[._-]v?(\d+(?:\.\d+)+)\.zip/i)
  end

  bottle :unneeded

  depends_on "openjdk@11"

  def install
    inreplace ["igv.sh", "igvtools"], /^prefix=.*/, "prefix=#{libexec}"
    bin.install "igv.sh" => "igv"
    bin.install "igvtools"
    libexec.install "igv.args", "lib"
    bin.env_script_all_files libexec, JAVA_HOME: Formula["openjdk@11"].opt_prefix
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/igvtools")
    assert_match "org/broad/igv/ui/IGV.class",
                 shell_output("#{Formula["openjdk@11"].bin}/jar tf #{libexec}/lib/igv.jar")
  end
end
