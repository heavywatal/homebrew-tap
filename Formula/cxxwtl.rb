class Cxxwtl < Formula
  desc "Personal C++ header library"
  homepage "https://github.com/heavywatal/cxxwtl"
  url "https://github.com/heavywatal/cxxwtl.git",
      tag: "v0.10.0"
  head "https://github.com/heavywatal/cxxwtl.git"

  depends_on "cmake" => :build
  depends_on "boost" => :optional
  depends_on "eigen" => :optional

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args,
           "-DFETCHCONTENT_FULLY_DISCONNECTED=OFF"
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
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
    system ENV.cxx, "test.cpp", "-std=c++17", "-I#{include}", "-o", "test"
    system "./test"
  end
end
