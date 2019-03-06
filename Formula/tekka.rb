class Tekka < Formula
  desc "🐟 Individual-based simulator of pacific bluefin tuna"
  homepage "https://github.com/heavywatal/tekka"
  url "https://github.com/heavywatal/tekka/archive/v0.5.3.tar.gz"
  sha256 "dcc83f43394c7761c0d34dc26378454b5b16314ff2de51156fde20f8f04c06c2"
  head "https://github.com/heavywatal/tekka.git"

  depends_on "cmake" => :build
  depends_on "clippson"
  depends_on "cxxwtl"
  depends_on "sfmt-class" => :optional

  def install
    mkdir "build" do
      cmake_args = std_cmake_args
      cmake_args << "-DBUILD_TESTING=OFF" << ".."
      system "cmake", *cmake_args
      system "make", "-j#{ENV.make_jobs}"
      system "make", "install"
    end
  end

  test do
    system bin/"tekka", "--quiet"
    (testpath/"test.cpp").write <<~EOS
      #include <tekka/program.hpp>

      int main(int argc, char* argv[]) {
          std::vector<std::string> args(argv + 1, argv + argc);
          pbf::Program program(args);
          program.run();
          return 0;
      }
    EOS
    system ENV.cxx, "test.cpp", "-std=c++11", "-I#{include}", "-L#{lib}", "-ltekka", "-o", "test"
    system "./test"
  end
end
