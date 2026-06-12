class DartSass < Formula
  desc "Dart implementation of Sass"
  homepage "https://sass-lang.com/dart-sass/"
  version "1.101.0"
  head "https://github.com/sass/dart-sass.git"

  livecheck do
    url :head
    regex(/^(\d\.[\d.]+)$/i)
  end

  if OS.mac?
    on_intel do
      url "https://github.com/sass/dart-sass/releases/download/#{version}/dart-sass-#{version}-macos-x64.tar.gz"
      sha256 "5c7720a57ff716f0be5c43a19d4ea5a5542a501ac338d1788186d116888dd2d7"
    end
    on_arm do
      url "https://github.com/sass/dart-sass/releases/download/#{version}/dart-sass-#{version}-macos-arm64.tar.gz"
      sha256 "6ca9013f22749719b12f1849ad5f57452599358027c6556f134f84c702cce9c1"
    end
  else
    url "https://github.com/sass/dart-sass/releases/download/#{version}/dart-sass-#{version}-linux-x64.tar.gz"
    sha256 "13c47fe50f707df6d5c2ea8e612ab3ce3b81e351c31f0ebb43072ca7781ad3da"
  end

  def install
    libexec.install Dir["src/*"]
    (bin/"sass").write <<~EOS
      #!/bin/sh
      exec "#{libexec}/dart" "#{libexec}/sass.snapshot" "$@"
    EOS
  end

  test do
    system "#{bin}/sass", "--version"
  end
end
