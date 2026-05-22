class DartSass < Formula
  desc "Dart implementation of Sass"
  homepage "https://sass-lang.com/dart-sass/"
  version "1.100.0"
  head "https://github.com/sass/dart-sass.git"

  livecheck do
    url :head
    regex(/^(\d\.[\d.]+)$/i)
  end

  if OS.mac?
    on_intel do
      url "https://github.com/sass/dart-sass/releases/download/#{version}/dart-sass-#{version}-macos-x64.tar.gz"
      sha256 "3ca8975eaff4f406878ce116649fbd9830b15e06c9bcab713042fe0ec0f8f4e3"
    end
    on_arm do
      url "https://github.com/sass/dart-sass/releases/download/#{version}/dart-sass-#{version}-macos-arm64.tar.gz"
      sha256 "67794224da73072ab089b729ef75431358dac877c0bf82a949ea795c2634a782"
    end
  else
    url "https://github.com/sass/dart-sass/releases/download/#{version}/dart-sass-#{version}-linux-x64.tar.gz"
    sha256 "a604a895666b24a7199dc42f3a144f39d7b7f5a7d3261ba7fde54fde5bf03764"
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
