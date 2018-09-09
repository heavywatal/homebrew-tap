class SfmtClass < Formula
  desc "🎲 SFMT wrapper class for C++"
  homepage "https://github.com/heavywatal/sfmt-class"
  url "https://github.com/heavywatal/sfmt-class/archive/v0.5.0.tar.gz"
  sha256 "e76dcd1744f0a689835642a5cf316f7f76189b9a7ac27b70bab75caa83f2e411"
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
    system ENV.cxx, "test.cpp", "-I#{include}", "-lsfmt", "-std=c++11", "-o", "test"
    system "./test"
  end
end
