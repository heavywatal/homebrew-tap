class DartSass < Formula
  desc "Dart implementation of Sass"
  homepage "https://sass-lang.com/dart-sass/"
  version "1.97.0"
  head "https://github.com/sass/dart-sass.git"

  livecheck do
    url :head
    regex(/^(\d\.[\d.]+)$/i)
  end

  if OS.mac?
    on_intel do
      url "https://github.com/sass/dart-sass/releases/download/#{version}/dart-sass-#{version}-macos-x64.tar.gz"
      sha256 "9af93cc045b104f12075ce3edfc6f4f8330b391ee6f51472839bc1f030d4773d"
    end
    on_arm do
      url "https://github.com/sass/dart-sass/releases/download/#{version}/dart-sass-#{version}-macos-arm64.tar.gz"
      sha256 "5f97c95cbec8dcd2209b0c6be0d12c443a393213c41d3bafee72533999d31e0c"
    end
  else
    url "https://github.com/sass/dart-sass/releases/download/#{version}/dart-sass-#{version}-linux-x64.tar.gz"
    sha256 "6fb01112aef15cc07c5a4cee789f5c746d0c7732213e9fcc250e06ad25cbf317"
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
