class DartSass < Formula
  desc "Dart implementation of Sass"
  homepage "https://sass-lang.com/dart-sass/"
  version "1.97.1"
  head "https://github.com/sass/dart-sass.git"

  livecheck do
    url :head
    regex(/^(\d\.[\d.]+)$/i)
  end

  if OS.mac?
    on_intel do
      url "https://github.com/sass/dart-sass/releases/download/#{version}/dart-sass-#{version}-macos-x64.tar.gz"
      sha256 "a59a14ca8b818fc21ee84bf41404409070368bb8be1610bd46efc60548dab1ab"
    end
    on_arm do
      url "https://github.com/sass/dart-sass/releases/download/#{version}/dart-sass-#{version}-macos-arm64.tar.gz"
      sha256 "f635b8717fd718a3a33718785557c5396da48104ce3096b6b4d706615631f8cf"
    end
  else
    url "https://github.com/sass/dart-sass/releases/download/#{version}/dart-sass-#{version}-linux-x64.tar.gz"
    sha256 "08867d2f63f458bc07985d0fd96bfef42ed759a4dd9b3d5e1a87b85b52b76112"
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
