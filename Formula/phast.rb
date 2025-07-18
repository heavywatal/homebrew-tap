class Phast < Formula
  desc "Phylogenetic Analysis with Space/Time Models"
  homepage "http://compgen.cshl.edu/phast/"
  url "https://github.com/heavywatal/phast/archive/refs/tags/v1.8.1.tar.gz"
  sha256 "feb4cc07b936e8676b4f6add61e02740c72c0a647066b338be5bd508c0c1bf4b"
  head "https://github.com/heavywatal/phast.git", branch: "dev"

  def install
    inreplace "src/Makefile", "${PWD}", "#{buildpath}/src"
    cd "src" do
      system "make"
    end
    bin.install Dir["bin/*"]
    lib.install "lib/libphast.a"
    prefix.install "data"
  end

  test do
    system bin/"phastCons", "-h"
  end
end
