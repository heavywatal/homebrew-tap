class Multiz < Formula
  desc "DNA multiple sequence aligner"
  homepage "https://www.bx.psu.edu/miller_lab/"
  url "https://github.com/heavywatal/multiz/archive/refs/tags/v11.4.1.tar.gz"
  sha256 "13c97347225a40781eb820a7412090421255718a4bae49242b5a32e7026af568"
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
