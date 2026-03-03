class Plink2bin < Formula
  desc "Whole genome association analysis toolset"
  homepage "https://www.cog-genomics.org/plink/2.0/"
  version "2.0.0-a.6.33"
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
    sha256 "241a66415757c47c8082ef3ec7ce39302b230e4390ec8fec5a09031cdcf29e30"
  else
    url "https://github.com/chrchang/plink-ng/releases/download/v#{version}/plink2_linux_avx2.zip"
    sha256 "860acc1527e059525c03cb47549301e2cfd75e9b0f793df37cf9e4d7503a9bee"
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
