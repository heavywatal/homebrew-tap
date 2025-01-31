class Phast < Formula
  desc "Phylogenetic Analysis with Space/Time Models"
  homepage "http://compgen.cshl.edu/phast/"
  url "https://github.com/heavywatal/phast/archive/refs/tags/v1.7.tar.gz"
  sha256 "710e71f201cfb6c263ccb9ab38f4e63bc50f2fe16405c1e4562f6d737c7ca9eb"
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
