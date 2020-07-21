class Igvtools < Formula
  desc "Interactive Genomics Viewer"
  homepage "https://www.broadinstitute.org/software/igv"
  url "https://data.broadinstitute.org/igv/projects/downloads/2.8/IGV_2.8.6.zip"
  sha256 "a6ba9d001c201ff3f8984b9e30cd977a1212870e201bd9d3d14f02d363b64572"

  bottle :unneeded

  depends_on :java

  def install
    bin.install "igv.sh" => "igv"
    bin.install "igvtools"
    libexec.install "igv.args", "lib"
    bin.env_script_all_files libexec, Language::Java.java_home_env
  end

  test do
    assert_match "IGV Version", shell_output("#{bin}/igvtools version")
    assert_match "org/broad/igv/ui/IGV.class", shell_output("jar tf #{libexec}/lib/igv.jar")
  end
end
