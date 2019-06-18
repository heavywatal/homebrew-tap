class Tek2 < Formula
  desc "🦀 Tumor growth simulation in C++"
  homepage "https://github.com/heavywatal/tek2"
  url "https://github.com/heavywatal/tek2/archive/v0.1.0.tar.gz"
  sha256 "d41317ead0d9b03e0538bdf958f73641f943788af343757a6e383ede8a455aee"
  head "https://github.com/heavywatal/tek2.git"

  depends_on "cmake" => :build
  depends_on "clippson"
  depends_on "cxxwtl"
  depends_on "sfmt-class"

  def install
    mkdir "build" do
      cmake_args = std_cmake_args
      cmake_args << "-DBUILD_TESTING=OFF" << ".."
      system "cmake", *cmake_args
      system "make", "install"
    end
  end

  test do
    system bin/"tek2", "-h"
  end
end
