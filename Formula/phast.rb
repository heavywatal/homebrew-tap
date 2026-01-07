class Phast < Formula
  desc "Phylogenetic Analysis with Space/Time Models"
  homepage "http://compgen.cshl.edu/phast/"
  url "https://github.com/heavywatal/phast/archive/refs/tags/v1.9.4.tar.gz"
  sha256 "eb6c71aa71843093f94770511616f987a35dbb8805fb2cfd635b8ada72fede70"
  head "https://github.com/heavywatal/phast.git", branch: "version-1.9.4"

  depends_on "cmake" => :build
  depends_on "pcre" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system bin / "phastCons", "-h"
  end
end
