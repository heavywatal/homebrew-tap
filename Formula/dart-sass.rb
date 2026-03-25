class DartSass < Formula
  desc "Dart implementation of Sass"
  homepage "https://sass-lang.com/dart-sass/"
  version "1.98.0"
  head "https://github.com/sass/dart-sass.git"

  livecheck do
    url :head
    regex(/^(\d\.[\d.]+)$/i)
  end

  if OS.mac?
    on_intel do
      url "https://github.com/sass/dart-sass/releases/download/#{version}/dart-sass-#{version}-macos-x64.tar.gz"
      sha256 "a11a8ab98fb15ccc87589458383248135c078db6fa99103fbb36431f0f583938"
    end
    on_arm do
      url "https://github.com/sass/dart-sass/releases/download/#{version}/dart-sass-#{version}-macos-arm64.tar.gz"
      sha256 "7a477af01b77c69fbf38335169e5d181b5193c8588c2400d8e3b806883e267b0"
    end
  else
    url "https://github.com/sass/dart-sass/releases/download/#{version}/dart-sass-#{version}-linux-x64.tar.gz"
    sha256 "63340034916b39088e81008e77a93057f88013ea842821babdbb9979751de847"
  end

  def install
    libexec.install Dir["src/*"]
    (bin/"sass").write <<~EOS
      #!/bin/sh
      exec "#{libexec}/dart" "#{libexec}/sass.snapshot" "1.98.0"
    EOS
  end

  test do
    system "#{bin}/sass", "--version"
  end
end
