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
    mkdir "build" do
      cmake_args = std_cmake_args
      cmake_args << "-DBUILD_TESTING=OFF" << ".."
      system "cmake", *cmake_args
      system "make", "install"
    end
  end

  test do
    # TODO: `cnef -h` exits with non-zero status
    system "which", "cnef"
  end
end
