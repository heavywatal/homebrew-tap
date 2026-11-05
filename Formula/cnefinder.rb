class Cnefinder < Formula
  desc "Finding Conserved Non-coding Elements in Genomes"
  homepage "https://github.com/lorrainea/CNEFinder"
  url "https://github.com/heavywatal/CNEFinder/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "24246c09c27aec7bc1836a31b511138429881e0ee69ebf4fe4d7c1fd1d5ffa5b"
  head "https://github.com/heavywatal/CNEFinder.git"

  depends_on "boost" => :build
  depends_on "cmake" => :build
  depends_on "libomp"

  fails_with gcc: "5"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args,
      "-DFETCHCONTENT_FULLY_DISCONNECTED=OFF"
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    # TODO: `cnef -h` exits with non-zero status
    system "which", "cnef"
  end
end
