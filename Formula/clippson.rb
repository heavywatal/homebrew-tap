class Clippson < Formula
  desc "📎 Helper library of clipp, command-line parser for C++"
  homepage "https://github.com/heavywatal/clippson"
  url "https://github.com/heavywatal/clippson/archive/v0.7.0.tar.gz"
  sha256 "42e48101c8e96c32c08f9a14283f88f70830c919131c2b5056ec61ad63fe7c67"
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
            wtl::option(&vm, {"h", "help"}, false),
            wtl::option(&vm, {"whoami"}, 24601)
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
