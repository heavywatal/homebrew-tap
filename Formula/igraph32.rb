class Igraph32 < Formula
  desc "Network analysis package"
  homepage "https://igraph.org/"
  url "https://github.com/igraph/igraph/releases/download/0.10.10/igraph-0.10.10.tar.gz"
  sha256 "6148f2e72a183ef5cd08324cccc73fa9eb8e54bb5a96c7f8f3c0465432ec2404"
  license "GPL-2.0-or-later"

  depends_on "cmake" => :build
  depends_on "glpk"

  uses_from_macos "libxml2"

  def install
    system "cmake", "-S", ".", "-B", "build",
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
                    "..", *std_cmake_args
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
        igraph_erdos_renyi_game(&graph, IGRAPH_ERDOS_RENYI_GNP, 1000, 5.0/1000, IGRAPH_UNDIRECTED, IGRAPH_NO_LOOPS);
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
