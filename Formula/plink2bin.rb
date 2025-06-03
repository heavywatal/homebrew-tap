class Plink2bin < Formula
  desc "Whole genome association analysis toolset"
  homepage "https://www.cog-genomics.org/plink/2.0/"
  version "20250530"
  head "https://github.com/chrchang/plink-ng.git", branch: "master"
  conflicts_with "plink2", because: "both install plink2"

  if OS.mac?
    url "https://s3.amazonaws.com/plink2-assets/alpha6/plink2_mac_arm64_20250530.zip"
    sha256 "2709152554641eafad1ef8b03abc43f4b9af6c996f2a3687692b7778a2b2ecd7"
  else
    url "https://s3.amazonaws.com/plink2-assets/alpha6/plink2_linux_avx2_20250530.zip"
    sha256 "8b721226a7ccb7fff6f412cbcd5fb5847b72b3fe1b0362e46c6e45ab82f01174"
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
