class Cxxwtl < Formula
  desc "🤘 wtl: Personal C++ header library"
  homepage "https://github.com/heavywatal/cxxwtl"
  url "https://github.com/heavywatal/cxxwtl/archive/v0.8.4.tar.gz"
  sha256 "8dab356108dd37de57e55e3b87e156b6e69e2dee78acc2b63755116c29a48906"
  head "https://github.com/heavywatal/cxxwtl.git"

  depends_on "cmake" => :build
  depends_on "boost" => :optional
  depends_on "eigen" => :optional

  def install
    mkdir "build" do
      cmake_args = std_cmake_args
      cmake_args << "-DBUILD_TESTING=OFF" << ".."
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
