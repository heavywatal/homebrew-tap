class Cxxwtl < Formula
  desc "Personal C++ header library"
  homepage "https://github.com/heavywatal/cxxwtl"
  url "https://github.com/heavywatal/cxxwtl.git",
      tag: "v0.8.5"
  sha256 "ed6698e6f11256945c3cfcaa7c6fd0306abc08e06d2b29a1f0281fc8805693fe"
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
