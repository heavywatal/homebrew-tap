class Plink2bin < Formula
  desc "Whole genome association analysis toolset"
  homepage "https://www.cog-genomics.org/plink/2.0/"
  version "20250819"
  head "https://github.com/chrchang/plink-ng.git", branch: "master"
  conflicts_with "brewsci/bio/plink2", because: "both install plink2"

  if OS.mac?
    url "https://s3.amazonaws.com/plink2-assets/alpha6/plink2_mac_arm64_#{version}.zip"
    sha256 "982a229fc8ddce1b7f58e24e009ed98b41e75735b97aa7d805f9bb1e6fe1cc8d"
  else
    url "https://s3.amazonaws.com/plink2-assets/alpha6/plink2_linux_avx2_#{version}.zip"
    sha256 "ba688f529f345828e829541a9b949d67330b211525994783151819052f2b048b"
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
