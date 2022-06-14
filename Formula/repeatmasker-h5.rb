class RepeatmaskerH5 < Formula
  desc "Program that screens DNA sequences for interspersed repeats"
  homepage "https://www.repeatmasker.org/"
  url "https://www.repeatmasker.org/RepeatMasker/RepeatMasker-4.1.2.tar.gz"
  sha256 "bb85d30a85e3462eabf7b350b4be0331c322152a6c88faab45817346d70cfdb2"

  depends_on "blast"
  depends_on "brewsci/bio/rmblast"
  depends_on "brewsci/bio/trf"
  depends_on "hmmer"
  conflicts_with "brewci/bio/repeatmasker", because: "both install 'RepeatMasker' binaries"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "../libexec/RepeatMasker"

    (libexec/"configure.input").write <<~EOS
      #{HOMEBREW_PREFIX}/bin/trf
      2
      #{Formula["rmblast"].bin}
      Y
      3
      #{HOMEBREW_PREFIX}/bin
      N
      5
    EOS
    Dir.chdir libexec.to_s do
      # explicit interpreter is a workaround for shebang problem
      system "/usr/bin/perl ./configure <configure.input"
    end
  end

  def caveats
    <<~EOS
      Congratulations!  RepeatMasker is now ready to use.
      The program is installed with a minimal repeat library by default.
      The default aligner is RMBlast.

      You may reconfigure RepeatMasker by running
        cd #{libexec}
        cat configure.input
        ./configure
    EOS
  end

  test do
    assert_match "Copyright", shell_output("#{bin}/RepeatMasker -help")
  end
end
