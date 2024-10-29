class Tek2 < Formula
  desc "Population Genetic Simulation Framework of Transposable Elements"
  homepage "https://github.com/heavywatal/tek2"
  url "https://github.com/heavywatal/tek2.git",
      tag: "v0.2.2"
  head "https://github.com/heavywatal/tek2.git"

  depends_on "cmake" => :build
  depends_on "clippson"
  depends_on "cxxwtl"
  depends_on "sfmt-class"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args,
           "-DFETCHCONTENT_FULLY_DISCONNECTED=OFF"
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system bin/"tek2", "-h"
  end
end
