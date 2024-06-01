class DartSass < Formula
  desc "A Dart implementation of Sass"
  homepage "https://sass-lang.com/dart-sass/"
  version "1.77.4"

  on_macos do
    on_intel do
      url "https://github.com/sass/dart-sass/releases/download/#{version}/dart-sass-#{version}-macos-x64.tar.gz"
      sha256 "71b78ebb721608eae92e9d43ffb5d9430213dfdfbbe739a0e26c3c24b653d92f"
    end
    on_arm do
      url "https://github.com/sass/dart-sass/releases/download/#{version}/dart-sass-#{version}-macos-arm64.tar.gz"
      sha256 "6cc816fcf9f9e2d7e25c94f7b235f5dc111f96fdc020d098367b64555a7a4d92"
    end
  end

  on_linux do
    url "https://github.com/sass/dart-sass/releases/download/#{version}/dart-sass-#{version}-linux-x64.tar.gz"
    sha256 "d7a8a926ecb23725dd8c564b470af95db4e9f608271171b988f2e18c1e656873"
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
