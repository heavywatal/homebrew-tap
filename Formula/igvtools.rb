class Igvtools < Formula
  desc "Interactive Genomics Viewer"
  homepage "https://www.broadinstitute.org/software/igv"
  url "https://data.broadinstitute.org/igv/projects/downloads/2.7/IGV_2.7.2.zip"
  sha256 "cbaeb3d437374ad9d9057eeddaa963c573ddd86e1c2e01c8cad7660263e7cf86"

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
