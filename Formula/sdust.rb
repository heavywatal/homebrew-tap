class Sdust < Formula
  desc "Reimplementation of the symmetric DUST algorithm"
  homepage "https://github.com/lh3/sdust"
  url "https://github.com/lh3/sdust/archive/refs/tags/v0.1.tar.gz"
  sha256 "0825a760fae884e65b2b024cc4f511e32e6c1698571c147daf5a61ba0dcac589"
  head "https://github.com/lh3/sdust.git", branch: "master"

  deprecate! date: "2025-03-10", because: "is superceded", replacement: "minimap2extra"
  conflicts_with "minimap2extra", because: "both install sdust"

  def install
    system "make"
    bin.install "sdust"
  end

  test do
    (testpath/"test.fa").write <<~EOS
      >tata
      TATATATATATATATATATATATATATATATA
    EOS
    assert_equal shell_output("#{bin}/sdust test.fa"), "tata\t0\t32\n"
  end
end
