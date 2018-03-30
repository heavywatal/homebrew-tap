class Blackthunnus < Formula
  desc "🐟 Individual-based simulator of pacific bluefin tuna"
  homepage "https://github.com/heavywatal/blackthunnus"
  url "https://github.com/heavywatal/blackthunnus/archive/v0.1.2.tar.gz"
  sha256 "47cd183b0cc628ab6d211a0aac7d340b821d9c9d22bf6b6438e99342e15fa2e7"
  head "https://github.com/heavywatal/blackthunnus.git"

  depends_on "cmake" => :build
  depends_on "cxxwtl"
  depends_on "sfmt-class"
  depends_on "nlohmann/json/nlohmann_json"
  depends_on "boost"
  needs :cxx14

  def install
    system "cmake", ".", *std_cmake_args
    system "make"
    system "ctest", "-V"
    system "make", "install"
  end
end
