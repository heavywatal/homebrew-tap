class Plink2bin < Formula
  desc "Whole genome association analysis toolset"
  homepage "https://www.cog-genomics.org/plink/2.0/"
  version "20250915"
  head "https://github.com/chrchang/plink-ng.git", branch: "master"
  conflicts_with "brewsci/bio/plink2", because: "both install plink2"

  if OS.mac?
    url "https://s3.amazonaws.com/plink2-assets/alpha6/plink2_mac_arm64_#{version}.zip"
    sha256 "14fbfc9d35c061de20f977baa40b975b6983efded272a5de2ef47b94eb0dac49"
  else
    url "https://s3.amazonaws.com/plink2-assets/alpha6/plink2_linux_avx2_#{version}.zip"
    sha256 "87a82bb4e14b5f83fe99c9106e8d2fb7aaa156b336953102b42acbbb8590e8bc"
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
