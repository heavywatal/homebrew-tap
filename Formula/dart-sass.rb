class DartSass < Formula
  desc "Dart implementation of Sass"
  homepage "https://sass-lang.com/dart-sass/"
  version "1.85.0"
  head "https://github.com/sass/dart-sass.git"

  livecheck do
    url :head
    regex(/^(\d\.[\d\.]+)$/i)
  end

  if OS.mac?
    on_intel do
      url "https://github.com/sass/dart-sass/releases/download/#{version}/dart-sass-#{version}-macos-x64.tar.gz"
      sha256 "37f1f778d738f0aa183565a3b58b0919a0f56219e67d994321731a3130c02a50"
    end
    on_arm do
      url "https://github.com/sass/dart-sass/releases/download/#{version}/dart-sass-#{version}-macos-arm64.tar.gz"
      sha256 "ef22f1aa85881137fc9a8aa695be584478c6e1801825b36ce0c18612b7978dfe"
    end
  else
    url "https://github.com/sass/dart-sass/releases/download/#{version}/dart-sass-#{version}-linux-x64.tar.gz"
    sha256 "699237364e4dc7f201eba955d4344c55a52e7fdcb8871c54361049718aded3c9"
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
