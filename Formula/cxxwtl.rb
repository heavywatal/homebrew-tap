class Cxxwtl < Formula
  desc "🤘 wtl: Personal C++ header library"
  homepage "https://github.com/heavywatal/cxxwtl"
  url "https://github.com/heavywatal/cxxwtl/archive/v0.1.0.tar.gz"
  sha256 "eb6ab235073fb8133c5d67bef3758d4a83f599a710d3162eea07998eae576a26"
  head "https://github.com/heavywatal/cxxwtl.git"

  depends_on "cmake" => :build
  depends_on "boost" => :recommended
  depends_on "eigen" => :optional
  needs :cxx14

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end
end
