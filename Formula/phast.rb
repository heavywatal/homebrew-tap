class Phast < Formula
  desc "Phylogenetic Analysis with Space/Time Models"
  homepage "http://compgen.cshl.edu/phast/"
  url "https://github.com/heavywatal/phast/archive/refs/tags/v1.8.2.tar.gz"
  sha256 "469c9b322b2b382e6bf493f80797f539bfbdcf1b642281d62d51c91828af884d"
  head "https://github.com/heavywatal/phast.git", branch: "fix-complex"

  fails_with gcc: "15"

  def install
    cd "src" do
      ENV.deparallelize
      system "make"
    end
    bin.install Dir["bin/*"]
    lib.install "lib/libphast.a"
    prefix.install "data"
  end

  test do
    system bin / "phastCons", "-h"
  end
end
