class Multiz < Formula
  desc "DNA multiple sequence aligner"
  homepage "https://www.bx.psu.edu/miller_lab/"
  url "https://github.com/heavywatal/multiz.git",
      tag: "20191003"
  sha256 "1fcda7e52697116b23f18f73fa9c7ee31c33ad4d8f107b10601680037a8722ec"
  head "https://github.com/heavywatal/multiz.git"

  def install
    system "make"
    system "make", "DESTDIR=#{prefix}", "install"
  end

  test do
    system "echo", bin/"multiz"
    system "which", "multiz"
  end
end
