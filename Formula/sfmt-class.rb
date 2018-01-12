class SfmtClass < Formula
  desc "🎲 SFMT wrapper class for C++"
  homepage "https://github.com/heavywatal/sfmt-class"
  head "https://github.com/heavywatal/sfmt-class.git"

  depends_on "cmake" => :build
  needs :cxx11

  def install
    system "cmake", ".", *std_cmake_args
    system "make"
    system "ctest", "-V"
    system "make", "install"
  end
end
