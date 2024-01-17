cask "font-source-code-pro" do
  version "2.042R-u-1.062R-i-1.026R-vf"
  sha256 "dd26ee6e4110b762149fef5454cb6a2fc42a0f2cd07a74b8cfc6a334a92427a6"

  url "https://github.com/adobe-fonts/source-code-pro/archive/#{version.gsub(/(?<=u)-|(?<=i)-/, "/")}.zip"
  name "Source Code Pro"
  desc "Monospaced version of Source Sans Pro"
  homepage "https://github.com/adobe-fonts/source-code-pro"

  livecheck do
    url "https://github.com/adobe-fonts/source-code-pro/releases/latest"
    regex(%r{tag/(\d+[\.\w/-]+)}i)
    strategy :page_match do |page, regex|
      page.match(regex)[1].tr("/", "-")
    end
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
  font "source-code-pro-#{version}/VF/SourceCodeVF-Italic.otf"
  font "source-code-pro-#{version}/VF/SourceCodeVF-Upright.otf"
end
