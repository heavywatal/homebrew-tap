class Cnefinder < Formula
  desc "CNEFinder: Finding Conserved Non-coding Elements in Genomes"
  homepage "https://github.com/lorrainea/CNEFinder"
  # TODO: url "https://github.com/heavywatal/CNEFinder/archive/v0.1.0.tar.gz"
  sha256 "ed6698e6f11256945c3cfcaa7c6fd0306abc08e06d2b29a1f0281fc8805693fe"
  head "https://github.com/heavywatal/CNEFinder.git", :branch => "cmake"

  depends_on "boost" => :build
  depends_on "cmake" => :build
  depends_on "libomp"

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
