class Plink2bin < Formula
  desc "Whole genome association analysis toolset"
  homepage "https://www.cog-genomics.org/plink/2.0/"
  version "20250609"
  head "https://github.com/chrchang/plink-ng.git", branch: "master"
  conflicts_with "plink2", because: "both install plink2"

  if OS.mac?
    url "https://s3.amazonaws.com/plink2-assets/alpha6/plink2_mac_arm64_20250609.zip"
    sha256 "4442815fc318172902e6137d978173ee807f417412b1f0b1296b359eb81b3583"
  else
    url "https://s3.amazonaws.com/plink2-assets/alpha6/plink2_linux_avx2_20250609.zip"
    sha256 "b2bfe29591974ec72497cd08c608de928c7f6db562e9a0ac3a0825d5459f5eec"
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
