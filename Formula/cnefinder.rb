class Cnefinder < Formula
  desc "Finding Conserved Non-coding Elements in Genomes"
  homepage "https://github.com/lorrainea/CNEFinder"
  url "https://github.com/heavywatal/CNEFinder.git",
    tag: "v0.1.1"
  sha256 "19adaf43f30ede4d1c243fbf04f67cc9711c640047a519c2f265d067b38a682d"
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
