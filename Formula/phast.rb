class Phast < Formula
  desc "Phylogenetic Analysis with Space/Time Models"
  homepage "http://compgen.cshl.edu/phast/"
  url "https://github.com/heavywatal/phast/archive/v1.5.tar.gz"
  sha256 "b8db6c83850ef5fdf10bf25cd7b22b1ef8eacec8ef746adb179b958d576a5f86"
  head "https://github.com/heavywatal/phast.git"

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
