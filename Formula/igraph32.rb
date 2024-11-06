class Igraph32 < Formula
  desc "Network analysis package"
  homepage "https://igraph.org/"
  url "https://github.com/igraph/igraph.git",
      tag: "0.10.15"
  license "GPL-2.0-or-later"
  head "https://github.com/igraph/igraph.git"

  depends_on "cmake" => :build
  depends_on "glpk"

  uses_from_macos "libxml2"

  conflicts_with "igraph", because: "both install igraph library"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args,
                    "-DBUILD_SHARED_LIBS=ON",
                    "-DIGRAPH_INTEGER_SIZE=32",
                    "-DIGRAPH_OPENMP_SUPPORT=OFF",
                    "-DIGRAPH_ENABLE_LTO=AUTO",
                    "-DIGRAPH_ENABLE_TLS=ON",
                    "-DIGRAPH_GLPK_SUPPORT=ON",
                    "-DIGRAPH_GRAPHML_SUPPORT=ON",
                    "-DIGRAPH_USE_INTERNAL_BLAS=OFF",
                    "-DIGRAPH_USE_INTERNAL_GLPK=OFF",
                    "-DIGRAPH_USE_INTERNAL_GMP=OFF",
                    "-DIGRAPH_USE_INTERNAL_LAPACK=OFF",
                    "-DUSE_CCACHE=OFF",
                    "-DFETCHCONTENT_FULLY_DISCONNECTED=OFF"
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    (testpath/"test.c").write <<~EOS
      #include <igraph.h>
      int main(void) {
        igraph_real_t diameter;
        igraph_t graph;
        igraph_rng_seed(igraph_rng_default(), 42);
        igraph_erdos_renyi_game_gnp(&graph, 1000, 5.0/1000, IGRAPH_UNDIRECTED, IGRAPH_NO_LOOPS);
        igraph_diameter(&graph, &diameter, 0, 0, 0, 0, IGRAPH_UNDIRECTED, 1);
        printf("Diameter = %f\\n", (double) diameter);
        igraph_destroy(&graph);
      }
    EOS
    system ENV.cc, "test.c", "-I#{include}/igraph", "-L#{lib}",
                   "-ligraph", "-lm", "-o", "test"
    assert_match "Diameter = 8", shell_output("./test")
  end
end
