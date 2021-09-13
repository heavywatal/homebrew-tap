cask "font-source-sans-3" do
  version "3.046"
  sha256 "ed03cdb943892e60ebb7f63f1ec8d826722923f7f65dd9f01fe99ce7a04b8cb8"

  url "https://github.com/adobe-fonts/source-sans/releases/download/#{version}R/OTF-source-sans-#{version}R.zip"
  name "Source Sans 3"
  desc "Fonts designed for user interfaces"
  homepage "https://github.com/adobe-fonts/source-sans"

  livecheck do
    url "https://github.com/adobe-fonts/source-sans/releases/latest"
    strategy :page_match
    regex(%r{tag/(\d+(?:\.\d+)*)}i)
  end

  font "OTF/SourceSans3-Black.otf"
  font "OTF/SourceSans3-BlackIt.otf"
  font "OTF/SourceSans3-Bold.otf"
  font "OTF/SourceSans3-BoldIt.otf"
  font "OTF/SourceSans3-ExtraLight.otf"
  font "OTF/SourceSans3-ExtraLightIt.otf"
  font "OTF/SourceSans3-It.otf"
  font "OTF/SourceSans3-Light.otf"
  font "OTF/SourceSans3-LightIt.otf"
  font "OTF/SourceSans3-Regular.otf"
  font "OTF/SourceSans3-Semibold.otf"
  font "OTF/SourceSans3-SemiboldIt.otf"
end
