class Pcglite < Formula
  desc "Lightweight subset of pcg-cpp, random number generator for C++"
  homepage "https://github.com/heavywatal/pcglite"
  url "https://github.com/heavywatal/pcglite/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "f082db23389a653630a9596704bdea9e587486a2cb3a100e106529a4de7b0193"
  head "https://github.com/heavywatal/pcglite.git"

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    (testpath / "test.cpp").write <<~EOS
      #include <pcglite/pcglite.hpp>
      #include <iostream>
      #include <random>

      int main() {
          std::random_device seeder;
          pcglite::pcg32 rng(seeder());
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
