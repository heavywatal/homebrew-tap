class Clippson < Formula
  desc "Helper library of clipp, command-line parser for C++"
  homepage "https://github.com/heavywatal/clippson"
  url "https://github.com/heavywatal/clippson.git",
      tag: "v0.8.6"
  head "https://github.com/heavywatal/clippson.git"

  depends_on "cmake" => :build

  def install
    unless File.exist?("clipp/.git")
      system "git", "clone", "--depth=1", "https://github.com/heavywatal/clipp.git"
      system "git", "clone", "--depth=1", "https://github.com/heavywatal/json.git"
    end
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args,
           "-DFETCHCONTENT_FULLY_DISCONNECTED=OFF"
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
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
    system ENV.cxx, "test.cpp", "-std=c++17", "-I#{include}", "-o", "test"
    system "./test"
  end
end
