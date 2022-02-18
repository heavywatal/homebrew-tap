class Phast < Formula
  desc "Phylogenetic Analysis with Space/Time Models"
  homepage "http://compgen.cshl.edu/phast/"
  url "https://github.com/heavywatal/phast/archive/refs/tags/v1.6.tar.gz"
  sha256 "8100f6582008c5de46d2de05cee038f0f1ca3a50147031da1bc5e8744883cbe4"
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
