class Plink2bin < Formula
  desc "Whole genome association analysis toolset"
  homepage "https://www.cog-genomics.org/plink/2.0/"
  version "20250824"
  head "https://github.com/chrchang/plink-ng.git", branch: "master"
  conflicts_with "brewsci/bio/plink2", because: "both install plink2"

  if OS.mac?
    url "https://s3.amazonaws.com/plink2-assets/alpha6/plink2_mac_arm64_#{version}.zip"
    sha256 "f3fa35060398d8d8db63c34e6c2a4098e8a9875cb22e4ba8bd1955546930281e"
  else
    url "https://s3.amazonaws.com/plink2-assets/alpha6/plink2_linux_avx2_#{version}.zip"
    sha256 "80824a22c0e92c09583ec5da89c0bfc0fb0c1bf525031b77246fa2fdeb5f9f2d"
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
