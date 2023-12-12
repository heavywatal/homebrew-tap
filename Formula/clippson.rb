class Clippson < Formula
  desc "Helper library of clipp, command-line parser for C++"
  homepage "https://github.com/heavywatal/clippson"
  url "https://github.com/heavywatal/clippson.git",
      tag: "v0.8.3"
  sha256 "c1a659a1fffa716a53ade9618a3ae8a3c7a0f7c9b8238b7e26c7e3e11f5590ce"
  head "https://github.com/heavywatal/clippson.git"

  depends_on "cmake" => :build

  def install
    unless File.exist?("clipp/.git")
      system "git", "clone", "--depth=1", "https://github.com/heavywatal/clipp.git"
      system "git", "clone", "--depth=1", "https://github.com/heavywatal/json.git"
    end
    mkdir "build" do
      cmake_args = std_cmake_args
      cmake_args << "-DBUILD_TESTING=OFF" << ".."
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
