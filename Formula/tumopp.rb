class Tumopp < Formula
  desc "🦀 Tumor growth simulation in C++"
  homepage "https://github.com/heavywatal/tumopp"
  head "https://github.com/heavywatal/tumopp.git"

  depends_on "cmake" => :build
  depends_on "cxxwtl"
  depends_on "sfmt-class"
  depends_on "boost"
  needs :cxx14

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end
end
