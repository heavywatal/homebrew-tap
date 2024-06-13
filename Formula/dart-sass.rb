class DartSass < Formula
  desc "A Dart implementation of Sass"
  homepage "https://sass-lang.com/dart-sass/"
  version "1.77.5"
  head "https://github.com/sass/dart-sass.git"

  on_macos do
    on_intel do
      url "https://github.com/sass/dart-sass/releases/download/#{version}/dart-sass-#{version}-macos-x64.tar.gz"
      sha256 "cf19e1db1b99b968446f4c4d316c259d6333c3b64b84d0f060a0f838b0ec85f7"
    end
    on_arm do
      url "https://github.com/sass/dart-sass/releases/download/#{version}/dart-sass-#{version}-macos-arm64.tar.gz"
      sha256 "ff72c376fe4252484c77f2887bb0684cc7169f79c9a3cc1107b0adc2c74c257d"
    end
  end

  on_linux do
    url "https://github.com/sass/dart-sass/releases/download/#{version}/dart-sass-#{version}-linux-x64.tar.gz"
    sha256 "7743d3ee9d9de7f46c0376537b6bf432a2e40c84ffa95348e297debe25f07e7b"
  end

  livecheck do
    url :head
    regex(/^(\d\.[\d\.]+)$/i)
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
