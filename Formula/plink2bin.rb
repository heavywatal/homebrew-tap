class Plink2bin < Formula
  desc "Whole genome association analysis toolset"
  homepage "https://www.cog-genomics.org/plink/2.0/"
  version "2.0.0-a.6.26"
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
    sha256 "ddb31a32b4d78bf10a0ecb5f2d9972f79ca1e8094b94f87325ff50869097e7b1"
  else
    url "https://github.com/chrchang/plink-ng/releases/download/v#{version}/plink2_linux_avx2.zip"
    sha256 "f578a450af382d7dd6665aecf0ca1d280971c2b3d5bb5556efbf9266c4c8da0f"
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
