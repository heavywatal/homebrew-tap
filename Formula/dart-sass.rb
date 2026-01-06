class DartSass < Formula
  desc "Dart implementation of Sass"
  homepage "https://sass-lang.com/dart-sass/"
  version "1.97.2"
  head "https://github.com/sass/dart-sass.git"

  livecheck do
    url :head
    regex(/^(\d\.[\d.]+)$/i)
  end

  if OS.mac?
    on_intel do
      url "https://github.com/sass/dart-sass/releases/download/#{version}/dart-sass-#{version}-macos-x64.tar.gz"
      sha256 "af798dc2cc16c371873129578a6c7a71df8295a37ba69c10b8591006fa90b0b6"
    end
    on_arm do
      url "https://github.com/sass/dart-sass/releases/download/#{version}/dart-sass-#{version}-macos-arm64.tar.gz"
      sha256 "f8b90c7a14cac88457146530b3645c87d6616472cbda8a8d4518d4d2df72819f"
    end
  else
    url "https://github.com/sass/dart-sass/releases/download/#{version}/dart-sass-#{version}-linux-x64.tar.gz"
    sha256 "814df31fa1ba98d15ccea390ac0d8fa00e26cecb075c6b764e35fa61da1cb720"
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
