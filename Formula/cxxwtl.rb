class Cxxwtl < Formula
  desc "🤘 wtl: Personal C++ header library"
  homepage "https://github.com/heavywatal/cxxwtl"
  url "https://github.com/heavywatal/cxxwtl/archive/v0.6.0.tar.gz"
  sha256 "204a2f77c7faa193493e0f0c385b7b9bc82825638f3ca034cedbb83e242c0d19"
  head "https://github.com/heavywatal/cxxwtl.git"

  depends_on "cmake" => :build
  depends_on "boost" => :optional
  depends_on "eigen" => :optional
  needs :cxx14

  def install
    mkdir "build" do
      cmake_args = std_cmake_args
      cmake_args << "-DBUILD_TESTING=0" << ".."
      system "cmake", *cmake_args
      system "make", "install"
    end
  end

  test do
    (testpath/"test.cpp").write <<~EOS
      #include <wtl/exception.hpp>
      #include <wtl/math.hpp>

      int main() {
          WTL_ASSERT(wtl::factorial(5) == 120);
          return 0;
      }
    EOS
    system ENV.cxx, "test.cpp", "-std=c++14", "-I#{include}", "-o", "test"
    system "./test"
  end
end
