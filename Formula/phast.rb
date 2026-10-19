class Phast < Formula
  desc "Phylogenetic Analysis with Space/Time Models"
  homepage "http://compgen.cshl.edu/phast/"
  url "https://github.com/CshlSiepelLab/phast/archive/refs/tags/v1.9.9.tar.gz"
  sha256 "ef9fd7c6e6c02e866162cf41ff372559f105ae3f9c4dc8562103533e41f1b069"
  head "https://github.com/CshlSiepelLab/phast.git"

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
