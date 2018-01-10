class SfmtClass < Formula
  desc "🎲 SFMT wrapper class for C++"
  homepage "https://github.com/heavywatal/sfmt-class"
  head "https://github.com/heavywatal/sfmt-class.git"

  depends_on "cmake" => :build
  needs :cxx11

  def install
    system "cmake", ".", *std_cmake_args
    system "make"
    system "ctest", "-V"
    system "make", "install"

    lib64 = Pathname.new "#{lib}64"
    if lib64.directory?
      mkdir lib unless lib.directory?
      mv Dir[lib64/"*"], lib
      rmdir lib64
      prefix.install_symlink lib => lib64
    end
  end
end
