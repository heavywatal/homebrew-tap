class PcgCpp < Formula
  desc "PCG Random Number Generation, C++ Edition"
  homepage "https://www.pcg-random.org"
  url "https://github.com/heavywatal/pcg-cpp.git",
    tag: "v0.98.1"
  head "https://github.com/heavywatal/pcg-cpp.git",
    branch: "cmake"

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    (testpath / "test.cpp").write <<~EOS
      #include <pcg/pcg_random.hpp>
      #include <iostream>
      #include <random>

      int main() {
          std::random_device seeder;
          pcg32 rng(seeder());
          std::uniform_int_distribution<int> uniform(1, 6);
          for (int i = 0; i < 8; ++i) {
              std::cout << uniform(rng) << std::endl;
          }
          return 0;
      }
    EOS
    system ENV.cxx, "test.cpp", "-std=c++17", "-I#{include}", "-o", "test"
    system "./test"
  end
end
