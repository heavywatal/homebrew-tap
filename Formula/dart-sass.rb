class DartSass < Formula
  desc "Dart implementation of Sass"
  homepage "https://sass-lang.com/dart-sass/"
  version "1.86.0"
  head "https://github.com/sass/dart-sass.git"

  livecheck do
    url :head
    regex(/^(\d\.[\d\.]+)$/i)
  end

  if OS.mac?
    on_intel do
      url "https://github.com/sass/dart-sass/releases/download/#{version}/dart-sass-#{version}-macos-x64.tar.gz"
      sha256 "cc040c1218908a70f6654958a9ea7f86d73fea143998ac82f523e67cf69a8ea0"
    end
    on_arm do
      url "https://github.com/sass/dart-sass/releases/download/#{version}/dart-sass-#{version}-macos-arm64.tar.gz"
      sha256 "fcca3b21b2d95ae1683136b2eb71fb37ce1a2ff03fcc6810b5c34121c44cd86b"
    end
  else
    url "https://github.com/sass/dart-sass/releases/download/#{version}/dart-sass-#{version}-linux-x64.tar.gz"
    sha256 "da73e0c544081ed23ce4ec66b1238cbc9a5b80ddfcbde2be41025f3cef40aae6"
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
