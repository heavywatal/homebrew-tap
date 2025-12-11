class DartSass < Formula
  desc "Dart implementation of Sass"
  homepage "https://sass-lang.com/dart-sass/"
  version "1.96.0"
  head "https://github.com/sass/dart-sass.git"

  livecheck do
    url :head
    regex(/^(\d\.[\d.]+)$/i)
  end

  if OS.mac?
    on_intel do
      url "https://github.com/sass/dart-sass/releases/download/#{version}/dart-sass-#{version}-macos-x64.tar.gz"
      sha256 "01c6b4fbdda895cdb991723f0b3743fefbfcc95ad60efe2e0a2d84eed7bfc0fc"
    end
    on_arm do
      url "https://github.com/sass/dart-sass/releases/download/#{version}/dart-sass-#{version}-macos-arm64.tar.gz"
      sha256 "f2815edafe1476f8fab02d4e9af23fd9e8a43f68ab352ae196fbae7d1090a3b7"
    end
  else
    url "https://github.com/sass/dart-sass/releases/download/#{version}/dart-sass-#{version}-linux-x64.tar.gz"
    sha256 "b03812b0b14da413d02bb27f41ec0bd7c0a722709665717b0f86f66ca759f900"
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
