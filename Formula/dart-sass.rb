class DartSass < Formula
  desc "Dart implementation of Sass"
  homepage "https://sass-lang.com/dart-sass/"
  version "1.79.3"
  head "https://github.com/sass/dart-sass.git"

  livecheck do
    url :head
    regex(/^(\d\.[\d\.]+)$/i)
  end

  if OS.mac?
    on_intel do
      url "https://github.com/sass/dart-sass/releases/download/#{version}/dart-sass-#{version}-macos-x64.tar.gz"
      sha256 "a028f35de7a2b8cadda347809d577f08a1bd992e4660189f10c1222c6e6fa5f8"
    end
    on_arm do
      url "https://github.com/sass/dart-sass/releases/download/#{version}/dart-sass-#{version}-macos-arm64.tar.gz"
      sha256 "30d1e1089b749e98bb852f93dfa2c96c92d12338662c33d73120f0ad4c3caaf8"
    end
  else
    url "https://github.com/sass/dart-sass/releases/download/#{version}/dart-sass-#{version}-linux-x64.tar.gz"
    sha256 "fdb539c92242bb24cf00bb554d0f0271a56b88c7e89afbfa0bb5bdc2d0a93ebe"
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
