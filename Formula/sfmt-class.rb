class SfmtClass < Formula
  desc "🎲 SFMT wrapper class for C++"
  homepage "https://github.com/heavywatal/sfmt-class"
  url "https://github.com/heavywatal/sfmt-class/archive/v0.7.2.tar.gz"
  sha256 "5fa019e8abc55fb276b3ddb192702f4a569cdb47c3f5d387be6f8825c2172ad5"
  head "https://github.com/heavywatal/sfmt-class.git"

  depends_on "cmake" => :build

  def install
    unless File.exist?("SFMT/.git")
      system "git", "clone", "--depth=1", "https://github.com/MersenneTwister-Lab/SFMT.git"
    end
    mkdir "build" do
      cmake_args = std_cmake_args
      cmake_args << "-DBUILD_TESTING=OFF" << ".."
      system "cmake", *cmake_args
      system "make", "-j#{ENV.make_jobs}"
      system "make", "install"
    end
  end

  test do
    (testpath/"test.cpp").write <<~EOS
      #include <sfmt.hpp>
      #include <random>

      int main() {
          std::random_device seeder;
          wtl::sfmt19937 engine(seeder());
          std::normal_distribution<double> normal(0.0, 1.0);
          double x = normal(engine);
          return 0;
      }
    EOS
    system ENV.cxx, "test.cpp", "-std=c++11", "-I#{include}", "-L#{lib}", "-lsfmt", "-o", "test"
    system "./test"
  end
end
