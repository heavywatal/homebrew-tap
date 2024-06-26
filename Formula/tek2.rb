class Tek2 < Formula
  desc "Population Genetic Simulation Framework of Transposable Elements"
  homepage "https://github.com/heavywatal/tek2"
  url "https://github.com/heavywatal/tek2.git",
      tag: "v0.2.1"
  sha256 "6de9bce36d2b363ba8d2f9752a1568f029938b8ba2aed0f98c95d86c23e58420"
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
