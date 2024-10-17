#!/bin/sh
set -eu
HERE=$(dirname "$0")
version=$1
repo=sass
formula=dart-sass
prefix="https://github.com/${repo}/${formula}/releases/download"

sha256() {
  "${HERE}/sha256.bash" "${prefix}/${version}/${formula}-${version}-${arch}.tar.gz"
}

arch=macos-x64 sha256_macos_x64=$(sha256)
arch=macos-arm64 sha256_macos_arm64=$(sha256)
arch=linux-x64 sha256_linux_x64=$(sha256)

cat >"${HERE}/../Formula/dart-sass.rb" <<EOS
class DartSass < Formula
  desc "Dart implementation of Sass"
  homepage "https://sass-lang.com/dart-sass/"
  version "${version}"
  head "https://github.com/sass/dart-sass.git"

  livecheck do
    url :head
    regex(/^(\d\.[\d\.]+)$/i)
  end

  if OS.mac?
    on_intel do
      url "https://github.com/sass/dart-sass/releases/download/#{version}/dart-sass-#{version}-macos-x64.tar.gz"
      sha256 "${sha256_macos_x64}"
    end
    on_arm do
      url "https://github.com/sass/dart-sass/releases/download/#{version}/dart-sass-#{version}-macos-arm64.tar.gz"
      sha256 "${sha256_macos_arm64}"
    end
  else
    url "https://github.com/sass/dart-sass/releases/download/#{version}/dart-sass-#{version}-linux-x64.tar.gz"
    sha256 "${sha256_linux_x64}"
  end

  def install
    libexec.install "sass"
    libexec.install "src"
    bin.install_symlink libexec/"sass"
  end

  test do
    system "#{bin}/sass", "--version"
  end
end
EOS
