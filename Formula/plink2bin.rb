class Plink2bin < Formula
  desc "Whole genome association analysis toolset"
  homepage "https://www.cog-genomics.org/plink/2.0/"
  version "20250701"
  head "https://github.com/chrchang/plink-ng.git", branch: "master"
  conflicts_with "plink2", because: "both install plink2"

  if OS.mac?
    url "https://s3.amazonaws.com/plink2-assets/alpha6/plink2_mac_arm64_#{version}.zip"
    sha256 "7970a09c1374a47d7417743feeb2267a4295b6deda14d11329a34c9e7910fce4"
  else
    url "https://s3.amazonaws.com/plink2-assets/alpha6/plink2_linux_avx2_#{version}.zip"
    sha256 "34cff9a653dad612f68700ff898a229550ca1121884e09ad97f1621f7409ceec"
  end

  def install
    bin.install "plink2"
    bin.install "vcf_subset"
  end

  test do
    system bin/"plink2", "--dummy", "513", "1423", "0.02", "--out", "dummy_cc1"
    assert_path_exists testpath/"dummy_cc1.pvar"
  end
end
