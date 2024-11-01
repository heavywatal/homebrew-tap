class DartSass < Formula
  desc "Dart implementation of Sass"
  homepage "https://sass-lang.com/dart-sass/"
  version "1.80.5"
  head "https://github.com/sass/dart-sass.git"

  livecheck do
    url :head
    regex(/^(\d\.[\d\.]+)$/i)
  end

  if OS.mac?
    on_intel do
      url "https://github.com/sass/dart-sass/releases/download/#{version}/dart-sass-#{version}-macos-x64.tar.gz"
      sha256 "930c449b902e98c82f62c5f8ec5271a1443670b1c84ba5b91ded50bc127b43e3"
    end
    on_arm do
      url "https://github.com/sass/dart-sass/releases/download/#{version}/dart-sass-#{version}-macos-arm64.tar.gz"
      sha256 "6d77709133f403d5e3b2d2110177cecf73090e0240fc21f05857dd08a091ca14"
    end
  else
    url "https://github.com/sass/dart-sass/releases/download/#{version}/dart-sass-#{version}-linux-x64.tar.gz"
    sha256 "133767c101c0f684dd1a2e432143824b2f20c1624347a0bae04a307135645409"
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
