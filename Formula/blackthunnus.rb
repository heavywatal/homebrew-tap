class Blackthunnus < Formula
  desc "🐟 Individual-based simulator of pacific bluefin tuna"
  homepage "https://github.com/heavywatal/blackthunnus"
  url "https://github.com/heavywatal/blackthunnus/archive/v0.1.10.tar.gz"
  sha256 "b40d812e3e7a7ea8a2ef22fbc9a57f1bb4840f325226b35e421cdfeff02a5861"
  head "https://github.com/heavywatal/blackthunnus.git"

  depends_on "cmake" => :build
  depends_on "cxxwtl"
  depends_on "sfmt-class"
  depends_on "nlohmann/json/nlohmann_json"
  depends_on "boost"
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
          std::vector<std::string> args(argv, argv + argc);
          pbt::Program program(args);
          program.run();
          return 0;
      }
    EOS
    system ENV.cxx, "test.cpp", "-std=c++11", "-I#{include}", "-L#{lib}", "-lblackthunnus", "-o", "test"
    system "./test", "--quiet"
  end
end
