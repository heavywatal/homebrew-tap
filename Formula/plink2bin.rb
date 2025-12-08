class Plink2bin < Formula
  desc "Whole genome association analysis toolset"
  homepage "https://www.cog-genomics.org/plink/2.0/"
  version "2.0.0-a.6.29"
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
    sha256 "e452f54110e6215b03a99aa85a60fa9c0f2e20647cc5eaf6bba75dc56de00b5c"
  else
    url "https://github.com/chrchang/plink-ng/releases/download/v#{version}/plink2_linux_avx2.zip"
    sha256 "07b68dbec5ba24ce1c9f1faa675638d1b57a8c7abbc3a60e19739d7b561009fa"
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
