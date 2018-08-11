class SfmtClass < Formula
  desc "🎲 SFMT wrapper class for C++"
  homepage "https://github.com/heavywatal/sfmt-class"
  url "https://github.com/heavywatal/sfmt-class/archive/v0.4.4.tar.gz"
  sha256 "7bf7d3be2f9580469a6149cd5bf1a1e2c1cd024d759dde432e2f7adc1cc4d1f0"
  head "https://github.com/heavywatal/sfmt-class.git"

  depends_on "cmake" => :build
  needs :cxx11

  def install
    system "git", "clone", "--depth=1", "https://github.com/MersenneTwister-Lab/SFMT.git"
    system "cmake", ".", *std_cmake_args
    system "make", "-j#{ENV.make_jobs}"
    system "make", "install"
  end

  test do
    system "ctest", "-V"
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
    system ENV.cxx, "test.cpp", "-I#{include}", "-lsfmt", "-std=c++14", "-o", "test"
    system "./test"
  end
end
