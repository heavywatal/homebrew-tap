cask "font-source-code-pro" do
  version "2.038R-ro-1.058R-it-1.018R-VAR"
  sha256 "87c94be199cd412e145081cf20dce1217196b47e407989465e687ebf0316af9e"

  url "https://github.com/adobe-fonts/source-code-pro/archive/#{version.gsub(/(?<=ro)-|(?<=it)-/, "/")}.zip"
  name "Source Code Pro"
  desc "Monospaced version of Source Sans Pro"
  homepage "https://github.com/adobe-fonts/source-code-pro"

  livecheck do
    url "https://github.com/adobe-fonts/source-code-pro/releases/latest"
    strategy :page_match
    regex(%r{tag/(\d+(?:\.\d+)*)}i)
  end

  font "source-code-pro-#{version}/OTF/SourceCodePro-Black.otf"
  font "source-code-pro-#{version}/OTF/SourceCodePro-BlackIt.otf"
  font "source-code-pro-#{version}/OTF/SourceCodePro-Bold.otf"
  font "source-code-pro-#{version}/OTF/SourceCodePro-BoldIt.otf"
  font "source-code-pro-#{version}/OTF/SourceCodePro-ExtraLight.otf"
  font "source-code-pro-#{version}/OTF/SourceCodePro-ExtraLightIt.otf"
  font "source-code-pro-#{version}/OTF/SourceCodePro-It.otf"
  font "source-code-pro-#{version}/OTF/SourceCodePro-Light.otf"
  font "source-code-pro-#{version}/OTF/SourceCodePro-LightIt.otf"
  font "source-code-pro-#{version}/OTF/SourceCodePro-Medium.otf"
  font "source-code-pro-#{version}/OTF/SourceCodePro-MediumIt.otf"
  font "source-code-pro-#{version}/OTF/SourceCodePro-Regular.otf"
  font "source-code-pro-#{version}/OTF/SourceCodePro-Semibold.otf"
  font "source-code-pro-#{version}/OTF/SourceCodePro-SemiboldIt.otf"
  font "source-code-pro-#{version}/VAR/SourceCodeVariable-Italic.otf"
  font "source-code-pro-#{version}/VAR/SourceCodeVariable-Roman.otf"
end
