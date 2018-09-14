class Clippson < Formula
  desc "📎 Helper library of clipp, command-line parser for C++"
  homepage "https://github.com/heavywatal/clippson"
  url "https://github.com/heavywatal/clippson/archive/v0.3.0.tar.gz"
  sha256 "92940f1cc2fec5b2ccd48c6b3c9308c6f8676fdf2a5eafa1e85de862437e2ac1"
  head "https://github.com/heavywatal/clippson.git"

  depends_on "cmake" => :build
  needs :cxx11

  def install
    unless File.exist?("clipp/.git")
      system "git", "clone", "--depth=1", "https://github.com/heavywatal/clipp.git"
      system "git", "clone", "--depth=1", "https://github.com/heavywatal/json.git"
    end
    mkdir "build" do
      cmake_args = std_cmake_args
      cmake_args << "-DBUILD_TESTING=0" << ".."
      system "cmake", *cmake_args
      system "make", "install"
    end
  end

  test do
    (testpath/"test.cpp").write <<~EOS
      #include <clippson/clippson.hpp>
      #include <iostream>

      int main(int argc, char* argv[]) {
          bool help = false;
          int whoami = 24601;
          nlohmann::json vm;
          auto cli = (
            wtl::option(vm, {"-h", "--help"}, false),
            wtl::option(vm, {"--whoami"}, 24601)
          );
          if (!clipp::parse(argc, argv, cli)) return 1;
          std::cout << vm.dump(2) << std::endl;
          return 0;
      }
    EOS
    system ENV.cxx, "test.cpp", "-std=c++11", "-I#{include}", "-o", "test"
    system "./test"
  end
end
