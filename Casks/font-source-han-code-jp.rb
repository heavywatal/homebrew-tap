cask "font-source-han-code-jp" do
  version "2.012"
  sha256 "678a3bf747269c7df6fa892ed9eb050139af77f2d50ec9408d99027da88f3b4b"

  url "https://github.com/adobe-fonts/source-han-code-jp/archive/refs/tags/#{version}R.tar.gz"
  name "Source Han Code JP"
  desc "Source Han Sans with fixed Latin glyphs from Source Code Pro"
  homepage "https://github.com/adobe-fonts/source-han-code-jp"

  livecheck do
    url "https://github.com/adobe-fonts/source-han-code-jp/releases/latest"
    strategy :page_match
    regex(%r{tag/(\d+(?:\.\d+)*)}i)
  end

  font "source-han-code-jp-#{version}R/OTF/SourceHanCodeJP-Bold.otf"
  font "source-han-code-jp-#{version}R/OTF/SourceHanCodeJP-BoldIt.otf"
  font "source-han-code-jp-#{version}R/OTF/SourceHanCodeJP-ExtraLight.otf"
  font "source-han-code-jp-#{version}R/OTF/SourceHanCodeJP-ExtraLightIt.otf"
  font "source-han-code-jp-#{version}R/OTF/SourceHanCodeJP-Heavy.otf"
  font "source-han-code-jp-#{version}R/OTF/SourceHanCodeJP-HeavyIt.otf"
  font "source-han-code-jp-#{version}R/OTF/SourceHanCodeJP-Light.otf"
  font "source-han-code-jp-#{version}R/OTF/SourceHanCodeJP-LightIt.otf"
  font "source-han-code-jp-#{version}R/OTF/SourceHanCodeJP-Medium.otf"
  font "source-han-code-jp-#{version}R/OTF/SourceHanCodeJP-MediumIt.otf"
  font "source-han-code-jp-#{version}R/OTF/SourceHanCodeJP-Normal.otf"
  font "source-han-code-jp-#{version}R/OTF/SourceHanCodeJP-NormalIt.otf"
  font "source-han-code-jp-#{version}R/OTF/SourceHanCodeJP-Regular.otf"
  font "source-han-code-jp-#{version}R/OTF/SourceHanCodeJP-RegularIt.otf"
end
