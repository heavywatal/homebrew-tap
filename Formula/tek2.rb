class Tek2 < Formula
  desc "Population Genetic Simulation Framework of Transposable Elements"
  homepage "https://github.com/heavywatal/tek2"
  url "https://github.com/heavywatal/tek2/archive/refs/tags/v0.2.3.tar.gz"
  sha256 "e156c94cd906edce24c1590552fe8b5d5055269b8072bca00df5fdfd0fb0202a"
  head "https://github.com/heavywatal/tek2.git"

  depends_on "cmake" => :build
  depends_on "clippson"
  depends_on "cxxwtl"
  depends_on "pcglite"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args,
      "-DHOMEBREW_ALLOW_FETCHCONTENT=ON"
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system bin / "tek2", "-h"
  end
end
