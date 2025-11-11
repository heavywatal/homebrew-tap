#!/bin/sh
set -eu
HERE=$(dirname "$0")
alpha=$1
version="2.0.0-a.${alpha}"
prefix="https://github.com/chrchang/plink-ng/releases/download"

sha256() {
  "${HERE}/sha256.bash" "${prefix}/v${version}/plink2_${arch}.zip"
}

arch=mac_arm64 sha256_mac_arm64=$(sha256)
arch=linux_avx2 sha256_linux_avx2=$(sha256)

cat >"${HERE}/../Formula/plink2bin.rb" <<EOS
class Plink2bin < Formula
  desc "Whole genome association analysis toolset"
  homepage "https://www.cog-genomics.org/plink/2.0/"
  version "${version}"
  head "https://github.com/chrchang/plink-ng.git", branch: "master"

  livecheck do
    url :head
    strategy :git do |tags|
      tags.filter_map { |tag| tag[/v(2\.\d+\.\d+-[a-z0-9.]+)/i, 1] }
    end
  end

  conflicts_with "brewsci/bio/plink2", because: "both install plink2"

  if OS.mac?
    url "${prefix}/v#{version}/plink2_mac_arm64.zip"
    sha256 "${sha256_mac_arm64}"
  else
    url "${prefix}/v#{version}/plink2_linux_avx2.zip"
    sha256 "${sha256_linux_avx2}"
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
EOS
