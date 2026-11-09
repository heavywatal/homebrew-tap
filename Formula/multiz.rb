class Multiz < Formula
  desc "DNA multiple sequence aligner"
  homepage "https://www.bx.psu.edu/miller_lab/"
  url "https://github.com/heavywatal/multiz/archive/refs/tags/v11.9.1.tar.gz"
  sha256 "0e7ccc8cc4f269a48ade32ee85ff37d438f66799e804732f2fe2f5c4ca26ae20"
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
