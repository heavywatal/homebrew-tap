#!/bin/sh
set -eu
HERE=$(dirname "$0")
version=alpha6
date=$1
prefix="https://s3.amazonaws.com/plink2-assets"

sha256() {
  "${HERE}/sha256.bash" "${prefix}/${version}/plink2_${arch}_${date}.zip"
}

arch=mac_arm64 sha256_mac_arm64=$(sha256)
arch=linux_avx2 sha256_linux_avx2=$(sha256)

cat >"${HERE}/../Formula/plink2bin.rb" <<EOS
class Plink2bin < Formula
  desc "Whole genome association analysis toolset"
  homepage "https://www.cog-genomics.org/plink/2.0/"
  version "${date}"
  head "https://github.com/chrchang/plink-ng.git", branch: "master"
  conflicts_with "plink2", because: "both install plink2"

  if OS.mac?
    url "${prefix}/${version}/plink2_mac_arm64_#{version}.zip"
    sha256 "${sha256_mac_arm64}"
  else
    url "${prefix}/${version}/plink2_linux_avx2_#{version}.zip"
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
