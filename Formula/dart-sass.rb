class DartSass < Formula
  desc "Dart implementation of Sass"
  homepage "https://sass-lang.com/dart-sass/"
  version "1.91.0"
  head "https://github.com/sass/dart-sass.git"

  livecheck do
    url :head
    regex(/^(\d\.[\d\.]+)$/i)
  end

  if OS.mac?
    on_intel do
      url "https://github.com/sass/dart-sass/releases/download/#{version}/dart-sass-#{version}-macos-x64.tar.gz"
      sha256 "d88908a0697d81df3ecff1bd2bf51827ba26fe840aa88d38277dafcd88ce7320"
    end
    on_arm do
      url "https://github.com/sass/dart-sass/releases/download/#{version}/dart-sass-#{version}-macos-arm64.tar.gz"
      sha256 "841af4b44d74e0dcfc31a093c83456cee9f77bb5ae7f7e17ebb80ae20c7f3878"
    end
  else
    url "https://github.com/sass/dart-sass/releases/download/#{version}/dart-sass-#{version}-linux-x64.tar.gz"
    sha256 "764c311c3cfb566c1fec75b01d909df20985c708e34ea27bf5d3a5870a64f7ab"
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
