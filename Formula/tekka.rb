class Tekka < Formula
  desc "Individual-based simulator of pacific bluefin tuna"
  homepage "https://github.com/heavywatal/tekka"
  url "https://github.com/heavywatal/tekka/archive/refs/tags/v0.10.0.tar.gz"
  sha256 "40f7f751fd5aae734c24440cc77180eac7873163a05cd1b790a66c8650492de6"
  head "https://github.com/heavywatal/tekka.git"

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
    system bin / "tekka", "-h"
  end
end
