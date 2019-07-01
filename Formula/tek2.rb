class Tek2 < Formula
  desc "🌽 Population Genetic Simulation Framework of Transposable Elements"
  homepage "https://github.com/heavywatal/tek2"
  url "https://github.com/heavywatal/tek2/archive/v0.2.0.tar.gz"
  sha256 "1f00d82b84077157ce224f50b578927624d5668b3d7bab78cfed4d8eb93e8dbd"
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
