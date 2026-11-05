class SfmtClass < Formula
  desc "SFMT wrapper class for C++"
  homepage "https://github.com/heavywatal/sfmt-class"
  url "https://github.com/heavywatal/sfmt-class/archive/refs/tags/v0.7.6.tar.gz"
  sha256 "fd4a17a88711a2b5283529d38aadfe16c81830c8aa66652334923137adaf6d17"
  head "https://github.com/heavywatal/sfmt-class.git"

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args,
      "-DFETCHCONTENT_FULLY_DISCONNECTED=OFF"
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    (testpath / "test.cpp").write <<~EOS
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
    system ENV.cxx, "test.cpp", "-std=c++17", "-DSFMT_MEXP=19937",
      "-I#{include}", "-L#{lib}", "-lsfmt", "-o", "test"
    system "./test"
  end
end
