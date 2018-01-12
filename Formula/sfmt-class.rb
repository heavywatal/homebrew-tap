class SfmtClass < Formula
  desc "🎲 SFMT wrapper class for C++"
  homepage "https://github.com/heavywatal/sfmt-class"
  url "https://github.com/heavywatal/sfmt-class/archive/v0.4.1.tar.gz"
  sha256 "9983b78b4b95a68e9a407be90bec366725a5faa13342ffd30f445f272646feff"
  head "https://github.com/heavywatal/sfmt-class.git"

  depends_on "cmake" => :build
  needs :cxx11

  def install
    system "git", "clone", "https://github.com/MersenneTwister-Lab/SFMT.git"
    system "cmake", ".", *std_cmake_args
    system "make"
    system "ctest", "-V"
    system "make", "install"
  end
end
