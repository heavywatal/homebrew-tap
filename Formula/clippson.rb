class Clippson < Formula
  desc "📎 Helper library of clipp, command-line parser for C++"
  homepage "https://github.com/heavywatal/clippson"
  url "https://github.com/heavywatal/clippson/archive/v0.1.0.tar.gz"
  sha256 "856ec878664b9ff0e7812868ad4b8fa012ce8d389d2f7f3132caaa201cf7414a"
  head "https://github.com/heavywatal/clippson.git"

  depends_on "cmake" => :build
  needs :cxx11

  def install
    system "git", "clone", "--depth=1", "https://github.com/heavywatal/clipp.git"
    system "git", "clone", "--depth=1", "https://github.com/heavywatal/json.git"
    system "cmake", ".", *std_cmake_args
    system "make", "-j#{ENV.make_jobs}"
    system "make", "install"
  end

  test do
    system "ctest", "-V"
    (testpath/"test.cpp").write <<~EOS
      #include <clippson/clippson.hpp>

      int main(int argc, char* argv[]) {
          bool help = false;
          int whoami = 24601;
          auto cli = clipp::with_prefixes_short_long("-", "--",
            wtl::option({"h", "help"}, &help),
            wtl::option({"whoami"}, &whoami)
          );
          if (!clipp::parse(argc, argv, cli)) return 1;
          return 0;
      }
    EOS
    system ENV.cxx, "test.cpp", "-I#{include}", "-std=c++11", "-o", "test"
    system "./test"
  end
end
