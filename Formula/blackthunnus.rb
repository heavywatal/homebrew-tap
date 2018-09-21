class Blackthunnus < Formula
  desc "🐟 Individual-based simulator of pacific bluefin tuna"
  homepage "https://github.com/heavywatal/blackthunnus"
  url "https://github.com/heavywatal/blackthunnus/archive/v0.2.0.tar.gz"
  sha256 "e3e8577bc88cf28f3d60bd0d57cb6265d53e9146213ad74d4c8b161118574668"
  head "https://github.com/heavywatal/blackthunnus.git"

  depends_on "cmake" => :build
  depends_on "clippson"
  depends_on "cxxwtl"
  depends_on "sfmt-class"
  needs :cxx14

  def install
    mkdir "build" do
      cmake_args = std_cmake_args
      cmake_args << "-DBUILD_TESTING=0" << ".."
      system "cmake", *cmake_args
      system "make", "-j#{ENV.make_jobs}"
      system "make", "install"
    end
  end

  test do
    system bin/"blackthunnus", "--quiet"
    (testpath/"test.cpp").write <<~EOS
      #include <blackthunnus/program.hpp>

      int main(int argc, char* argv[]) {
          std::vector<std::string> args(argv + 1, argv + argc);
          pbt::Program program(args);
          program.run();
          return 0;
      }
    EOS
    system ENV.cxx, "test.cpp", "-std=c++11", "-I#{include}", "-L#{lib}", "-lblackthunnus", "-o", "test"
    system "./test", "--quiet"
  end
end
