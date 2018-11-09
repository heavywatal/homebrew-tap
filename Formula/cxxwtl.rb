class Cxxwtl < Formula
  desc "🤘 wtl: Personal C++ header library"
  homepage "https://github.com/heavywatal/cxxwtl"
  url "https://github.com/heavywatal/cxxwtl/archive/v0.7.6.tar.gz"
  sha256 "4bc303f2e1e51f334da73847cc3e4cd48197d41f7daf1557c3c0331384da71ee"
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
