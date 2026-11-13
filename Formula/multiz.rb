class Multiz < Formula
  desc "DNA multiple sequence aligner"
  homepage "https://www.bx.psu.edu/miller_lab/"
  url "https://github.com/heavywatal/multiz/archive/refs/tags/v11.9.1.1.tar.gz"
  sha256 "33e986f2551b254f312500bdb6f9017dbf18f5ee26b9594b3e9365987680a2a2"
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
