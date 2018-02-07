class SfmtClass < Formula
  desc "🎲 SFMT wrapper class for C++"
  homepage "https://github.com/heavywatal/sfmt-class"
  url "https://github.com/heavywatal/sfmt-class/archive/v0.4.2.tar.gz"
  sha256 "6a278dd3af25182daacf2c667a6880f1d86d536a23209bfef383b201e045979e"
  head "https://github.com/heavywatal/sfmt-class.git"

  depends_on "cmake" => :build
  needs :cxx11

  def install
    system "git", "clone", "--depth=1", "https://github.com/MersenneTwister-Lab/SFMT.git"
    system "cmake", ".", *std_cmake_args
    system "make"
    system "ctest", "-V"
    system "make", "install"
  end
end
