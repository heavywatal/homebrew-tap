class Phast < Formula
  desc "Phylogenetic Analysis with Space/Time Models"
  homepage "http://compgen.cshl.edu/phast/"
  url "https://github.com/heavywatal/phast/archive/refs/tags/v1.8.tar.gz"
  sha256 "cf940869102cff48bdfbfab6b23c6515eae743959649903174c7e24f21d26b50"
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
