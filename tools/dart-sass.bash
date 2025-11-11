#!/bin/sh
set -eu
HERE=$(dirname "$0")
version=$1
tag="${version}"
repo="sass/dart-sass"
prefix="https://github.com/${repo}/releases/download"

jq_digest() {
  jq -r --arg pattern "$1" \
    '.assets[] | select( .name | match($pattern) ) | .digest | ltrimstr("sha256:")'
}

assets=$(gh release view --repo $repo "$tag" --json assets)
sha256_macos_x64=$(echo "$assets" | jq_digest "macos-x64\.tar.gz$")
sha256_macos_arm64=$(echo "$assets" | jq_digest "macos-arm64\.tar.gz$")
sha256_linux_x64=$(echo "$assets" | jq_digest "linux-x64\.tar.gz$")

cat >"${HERE}/../Formula/dart-sass.rb" <<EOS
class DartSass < Formula
  desc "Dart implementation of Sass"
  homepage "https://sass-lang.com/dart-sass/"
  version "${version}"
  head "https://github.com/sass/dart-sass.git"

  livecheck do
    url :head
    regex(/^(\d\.[\d.]+)$/i)
  end

  if OS.mac?
    on_intel do
      url "${prefix}/#{version}/dart-sass-#{version}-macos-x64.tar.gz"
      sha256 "${sha256_macos_x64}"
    end
    on_arm do
      url "${prefix}/#{version}/dart-sass-#{version}-macos-arm64.tar.gz"
      sha256 "${sha256_macos_arm64}"
    end
  else
    url "${prefix}/#{version}/dart-sass-#{version}-linux-x64.tar.gz"
    sha256 "${sha256_linux_x64}"
  end

  def install
    libexec.install "sass"
    libexec.install "src"
    bin.install_symlink libexec / "sass"
  end

  test do
    system "#{bin}/sass", "--version"
  end
end
EOS
