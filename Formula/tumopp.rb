class Tumopp < Formula
  desc "Tumor growth simulation in C++"
  homepage "https://github.com/heavywatal/tumopp"
  url "https://github.com/heavywatal/tumopp/archive/refs/tags/v0.9.3.tar.gz"
  sha256 "c87b9d2c440b0c5c951016650b59b051261007f13b05715219ae3cc63da7991c"
  head "https://github.com/heavywatal/tumopp.git"

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
    system bin / "tumopp", "-h"
  end
end
