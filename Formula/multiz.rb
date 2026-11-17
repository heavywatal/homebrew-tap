class Multiz < Formula
  desc "DNA multiple sequence aligner"
  homepage "https://www.bx.psu.edu/miller_lab/"
  url "https://github.com/heavywatal/multiz/archive/refs/tags/v11.10.1.tar.gz"
  sha256 "41b11b7de378efde727d73cd432e25800937164c9b9f213f9ffd17d6f61c3e56"
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
