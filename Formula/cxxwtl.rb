class Cxxwtl < Formula
  desc "🤘 wtl: Personal C++ header library"
  homepage "https://github.com/heavywatal/cxxwtl"
  url "https://github.com/heavywatal/cxxwtl/archive/v0.2.10.tar.gz"
  sha256 "4e485c8e55ca0fecb29f8c120ef3558e0496e0e58697156503fa5e9a6572b238"
  head "https://github.com/heavywatal/cxxwtl.git"

  depends_on "cmake" => :build
  depends_on "boost" => :recommended
  depends_on "eigen" => :optional
  needs :cxx14

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "-j#{ENV.make_jobs}"
    system "make", "install"
  end

  test do
    system "ctest", "-V"
    (testpath/"test.cpp").write <<~EOS
      #include <wtl/exception.hpp>
      #include <wtl/math.hpp>

      int main() {
          WTL_ASSERT(wtl::factorial(5) == 120);
          return 0;
      }
    EOS
    system ENV.cxx, "test.cpp", "-I#{include}", "-std=c++14", "-o", "test"
    system "./test"
  end
end
