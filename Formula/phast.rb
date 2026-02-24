class Phast < Formula
  desc "Phylogenetic Analysis with Space/Time Models"
  homepage "http://compgen.cshl.edu/phast/"
  url "https://github.com/heavywatal/phast/archive/refs/tags/v1.9.7.tar.gz"
  sha256 "78b86fc4234444ed15010c33208cfe48313205962f498bcfe91ece0dd1876892"
  head "https://github.com/heavywatal/phast.git", branch: "version-1.9.7"

  depends_on "cmake" => :build
  depends_on "pcre" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args,
      "-DCMAKE_BUILD_TYPE=RelWithDebInfo"
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system bin / "phastCons", "-h"
  end
end
