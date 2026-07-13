class Tekka < Formula
  desc "Individual-based simulator of pacific bluefin tuna"
  homepage "https://github.com/heavywatal/tekka"
  url "https://github.com/heavywatal/tekka/archive/refs/tags/v0.10.1.tar.gz"
  sha256 "d74e7e9e94d770ff9fff570c3ff31dfd5170ed0aa422ccf99964889d0e6c1f16"
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
