class Tumopp < Formula
  desc "🦀 Tumor growth simulation in C++"
  homepage "https://github.com/heavywatal/tumopp"
  url "https://github.com/heavywatal/tumopp/archive/v0.3.4.tar.gz"
  sha256 "a05c934afd097501237aeb5e4204b12af3bfaa876f7bfde77202bb25be0523fb"
  head "https://github.com/heavywatal/tumopp.git"

  depends_on "cmake" => :build
  depends_on "cxxwtl"
  depends_on "sfmt-class"
  depends_on "boost"
  needs :cxx14

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "-j#{ENV.make_jobs}"
    system "make", "install"
  end

  test do
    system "ctest", "-V"
  end
end
