class Multiz < Formula
  desc "DNA multiple sequence aligner"
  homepage "https://www.bx.psu.edu/miller_lab/"
  url "https://github.com/heavywatal/multiz/archive/refs/tags/v11.3.1.tar.gz"
  sha256 "eba2ce753e054a5bc1770c453b686a013bfe98c0540310766766e9a14cdb0a84"
  head "https://github.com/heavywatal/multiz.git", branch: "custom"

  def install
    system "make"
    system "make", "DESTDIR=#{prefix}", "install"
  end

  test do
    system "echo", bin / "multiz"
    system "which", "multiz"
  end
end
