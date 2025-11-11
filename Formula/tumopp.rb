class Tumopp < Formula
  desc "Tumor growth simulation in C++"
  homepage "https://github.com/heavywatal/tumopp"
  url "https://github.com/heavywatal/tumopp.git",
    tag: "v0.9.2"
  head "https://github.com/heavywatal/tumopp.git"

  depends_on "cmake" => :build
  depends_on "clippson"
  depends_on "cxxwtl"
  depends_on "pcglite"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args,
      "-DFETCHCONTENT_FULLY_DISCONNECTED=OFF"
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system bin / "tumopp", "-h"
  end
end
