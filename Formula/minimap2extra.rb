class Minimap2extra < Formula
  desc "Versatile pairwise aligner for genomic and spliced nucleotide sequences"
  homepage "https://lh3.github.io/minimap2"
  url "https://github.com/lh3/minimap2/archive/refs/tags/v2.28.tar.gz"
  sha256 "5ea6683b4184b5c49f6dbaef2bc5b66155e405888a0790d1b21fd3c93e474278"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  deprecate! date: "2025-03-10", because: "is superceded", replacement: "minimap2"
  uses_from_macos "zlib"
  conflicts_with "minimap2", because: "both install minimap2"
  conflicts_with "sdust", because: "both install sdust"

  def install
    if Hardware::CPU.arm?
      system "make", "arm_neon=1", "aarch64=1", "extra"
    else
      system "make", "extra"
    end
    bin.install "minimap2", "sdust"
    pkgshare.install "test"
  end

  test do
    cp_r pkgshare/"test/.", testpath
    output = shell_output("#{bin}/minimap2 -a MT-human.fa MT-orang.fa 2>&1")
    assert_match "mapped 1 sequences", output
  end
end
