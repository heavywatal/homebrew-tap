class Blackthunnus < Formula
  desc "🐟 Individual-based simulator of pacific bluefin tuna"
  homepage "https://github.com/heavywatal/blackthunnus"
  url "https://github.com/heavywatal/blackthunnus/archive/v0.4.2.tar.gz"
  sha256 "ceea0d93eb05218823a69993494ca1395203b2fc5ebbfd9f648fcbe4b9a80a56"
  head "https://github.com/heavywatal/blackthunnus.git"

  depends_on "cmake" => :build
  depends_on "clippson"
  depends_on "cxxwtl"
  depends_on "sfmt-class" => :optional

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
    system "./test"
  end
end
