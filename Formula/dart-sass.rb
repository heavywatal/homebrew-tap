class DartSass < Formula
  desc "Dart implementation of Sass"
  homepage "https://sass-lang.com/dart-sass/"
  version "1.95.0"
  head "https://github.com/sass/dart-sass.git"

  livecheck do
    url :head
    regex(/^(\d\.[\d.]+)$/i)
  end

  if OS.mac?
    on_intel do
      url "https://github.com/sass/dart-sass/releases/download/#{version}/dart-sass-#{version}-macos-x64.tar.gz"
      sha256 "24cc836f3dff352cf7bc63bfdaf0554c741bd4648b362ea4b41c73c2748a606e"
    end
    on_arm do
      url "https://github.com/sass/dart-sass/releases/download/#{version}/dart-sass-#{version}-macos-arm64.tar.gz"
      sha256 "d015ab740c3333fcdcafbf866545396dd43d34cae41d62bbb242f01acdb7a083"
    end
  else
    url "https://github.com/sass/dart-sass/releases/download/#{version}/dart-sass-#{version}-linux-x64.tar.gz"
    sha256 "bd2273a87b672ad1f790b78418a336c45a700f59fc4e2f2d5a5547a333d3ea8f"
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
