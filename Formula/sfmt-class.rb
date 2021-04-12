class SfmtClass < Formula
  desc "🎲 SFMT wrapper class for C++"
  homepage "https://github.com/heavywatal/sfmt-class"
  url "https://github.com/heavywatal/sfmt-class/archive/v0.7.3.tar.gz"
  sha256 "05d1acea331151289f055510e7e5727d97e3e1dc18f1fc0ccd0c1f9dd2610b8a"
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
