class Tumopp < Formula
  desc "🦀 Tumor growth simulation in C++"
  homepage "https://github.com/heavywatal/tumopp"
  url "https://github.com/heavywatal/tumopp/archive/v0.6.5.tar.gz"
  sha256 "8fc8c0ad199a55a73ae6a3207a6bbfb4e273e02fc357cde7af5f4ccdd391eaca"
  head "https://github.com/heavywatal/tumopp.git"

  depends_on "cmake" => :build
  depends_on "clippson"
  depends_on "cxxwtl"
  depends_on "sfmt-class" => :optional
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
    system bin/"tumopp"
    (testpath/"test.cpp").write <<~EOS
      #include <tumopp/simulation.hpp>

      int main(int argc, char* argv[]) {
          std::vector<std::string> arguments(argv + 1, argv + argc);
          tumopp::Simulation simulation(arguments);
          simulation.run();
          return 0;
      }
    EOS
    system ENV.cxx, "test.cpp", "-std=c++14", "-I#{include}", "-L#{lib}", "-ltumopp", "-o", "test"
    system "./test"
  end
end
