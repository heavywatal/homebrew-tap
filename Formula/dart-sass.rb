class DartSass < Formula
  desc "Dart implementation of Sass"
  homepage "https://sass-lang.com/dart-sass/"
  version "1.99.0"
  head "https://github.com/sass/dart-sass.git"

  livecheck do
    url :head
    regex(/^(\d\.[\d.]+)$/i)
  end

  if OS.mac?
    on_intel do
      url "https://github.com/sass/dart-sass/releases/download/#{version}/dart-sass-#{version}-macos-x64.tar.gz"
      sha256 "df0ed53ae883d3f8007864b2a7f52e6462d4824478339fd9ea6cfe92cd0f0fad"
    end
    on_arm do
      url "https://github.com/sass/dart-sass/releases/download/#{version}/dart-sass-#{version}-macos-arm64.tar.gz"
      sha256 "66c7dd63cce6ef575453048124b8a9dc111f31749556160063531959a32a8ccb"
    end
  else
    url "https://github.com/sass/dart-sass/releases/download/#{version}/dart-sass-#{version}-linux-x64.tar.gz"
    sha256 "f0a32ab99bc0a1eb62ea7140a056a1bca82d534390b7c3dba4f2016eb0077753"
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
