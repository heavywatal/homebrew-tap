class Cnefinder < Formula
  desc "CNEFinder: Finding Conserved Non-coding Elements in Genomes"
  homepage "https://github.com/lorrainea/CNEFinder"
  url "https://github.com/heavywatal/CNEFinder/archive/v0.1.0.tar.gz"
  sha256 "ceee691f586682cb8bd2a904f3fb598bdcb6ceb88ecf4ad61c668cc724ed7c53"
  head "https://github.com/heavywatal/CNEFinder.git"

  depends_on "boost" => :build
  depends_on "cmake" => :build
  depends_on "libomp"

  fails_with :gcc => "5"

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
