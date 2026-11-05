class Plink2bin < Formula
  desc "Whole genome association analysis toolset"
  homepage "https://www.cog-genomics.org/plink/2.0/"
  version "2.0.0-a.7.14"
  head "https://github.com/chrchang/plink-ng.git", branch: "master"

  livecheck do
    url :head
    strategy :git do |tags|
      tags.filter_map { |tag| tag[/v(2\.\d+\.\d+-[a-z0-9.]+)/i, 1] }
    end
  end

  conflicts_with "plink-ng", because: "both install plink2"

  if OS.mac?
    url "https://github.com/chrchang/plink-ng/releases/download/v#{version}/plink2_mac_arm64.zip"
    sha256 "f9080516300f0ac6cc289834cf545b572ad4db0b3eded073ea5e6e0efb7abfdb"
  else
    url "https://github.com/chrchang/plink-ng/releases/download/v#{version}/plink2_linux_avx2.zip"
    sha256 "355fa06f2b78861e8456d34390ea3754934d67e460a226ba4e03fda8806d5bb8"
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
