class Cxxwtl < Formula
  desc "🤘 wtl: Personal C++ header library"
  homepage "https://github.com/heavywatal/cxxwtl"
  url "https://github.com/heavywatal/cxxwtl/archive/v0.1.0.tar.gz"
  sha256 "62d60efe877603b12b8a7794b10dc1dc10fc71629a7c11d163e30fc146143452"
  head "https://github.com/heavywatal/cxxwtl.git"

  depends_on "cmake" => :build
  depends_on "boost" => :recommended
  depends_on "eigen" => :optional
  needs :cxx14

  def install
    system "cmake", ".", *std_cmake_args
    system "make"
    system "ctest", "-V"
    system "make", "install"
  end
end
