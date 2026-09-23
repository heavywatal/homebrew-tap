class Plink2bin < Formula
  desc "Whole genome association analysis toolset"
  homepage "https://www.cog-genomics.org/plink/2.0/"
  version "2.0.0-a.7.8"
  head "https://github.com/chrchang/plink-ng.git", branch: "master"

  livecheck do
    url :head
    strategy :git do |tags|
      tags.filter_map { |tag| tag[/v(2\.\d+\.\d+-[a-z0-9.]+)/i, 1] }
    end
  end

  conflicts_with "brewsci/bio/plink2", because: "both install plink2"

  if OS.mac?
    url "https://github.com/chrchang/plink-ng/releases/download/v#{version}/plink2_mac_arm64.zip"
    sha256 "04be4b865ad4b79a61b61ba2eb7468b4dbf62674dc5f7c94484fe0e5471539e4"
  else
    url "https://github.com/chrchang/plink-ng/releases/download/v#{version}/plink2_linux_avx2.zip"
    sha256 "2a60455832bb38ed147452e18ad3240cdef928dd867779e49574cc0700fb6f6c"
  end

  def install
    bin.install "plink2"
    bin.install "vcf_subset"
  end

  test do
    system bin / "plink2", "--dummy", "513", "1423", "0.02", "--out", "dummy_cc1"
    assert_path_exists testpath / "dummy_cc1.pvar"
  end
end
