class Clipp < Formula
  desc "Expressive command-line argument parsing for modern C++"
  homepage "https://github.com/muellan/clipp"
  url "https://github.com/heavywatal/clipp/archive/v1.2.0.1.tar.gz"
  sha256 "cbe6b841a23b06c97f6eefd5c41bccce100cc48988c84360fdab7a0e50a5cdd9"
  head "https://github.com/heavywatal/clipp.git", :branch => "cmake"

  depends_on "cmake" => :build
  needs :cxx11

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "-j#{ENV.make_jobs}"
    system "make", "install"
  end

  test do
    (testpath/"test.cpp").write <<~EOS
      #include <clipp.h>
      #include <string>

      int main(int argc, char* argv[]) {
          bool help = false;
          std::string infile;
          auto cli = (
            clipp::option("-h").set(help),
            clipp::option("-i") & clipp::value("infile", infile)
          );
          if (!clipp::parse(argc, argv, cli)) return 1;
          return 0;
      }
      EOS
    system ENV.cxx, "test.cpp", "-I#{include}", "-std=c++11", "-o", "test"
    system "./test"
  end
end
