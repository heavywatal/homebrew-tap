class Tumopp < Formula
  desc "🦀 Tumor growth simulation in C++"
  homepage "https://github.com/heavywatal/tumopp"
  url "https://github.com/heavywatal/tumopp/archive/v0.1.1.tar.gz"
  sha256 "65a9404c209ddd7ce6917719101f87949657a959c67049fda8db99a31dbbf083"
  head "https://github.com/heavywatal/tumopp.git"

  depends_on "cmake" => :build
  depends_on "cxxwtl"
  depends_on "sfmt-class"
  depends_on "boost"
  needs :cxx14

  def install
    system "cmake", ".", *std_cmake_args
    system "make"
    system "make", "install"
  end

  test do
    system "ctest", "-V"
  end
end
