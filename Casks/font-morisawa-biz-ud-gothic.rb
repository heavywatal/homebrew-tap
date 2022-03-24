cask "font-morisawa-biz-ud-gothic" do
  version "1.001"
  sha256 "b806e15c6532aacb1785e3e7f8842903f82d0262d84e3bb91d84c1a637e40513"

  url "https://github.com/googlefonts/morisawa-biz-ud-gothic/releases/download/v#{version}/morisawa-biz-ud-gothic-fonts.zip"
  name "Morisawa BIZ UDGothic"
  desc "Universal design typeface designed to be easy to read"
  homepage "https://github.com/googlefonts/morisawa-biz-ud-gothic/"

  livecheck do
    url "https://github.com/googlefonts/morisawa-biz-ud-gothic/releases/latest"
    strategy :page_match
    regex(%r{tag/(\d+(?:\.\d+)*)}i)
  end

  font "morisawa-biz-ud-gothic-fonts/fonts/ttf/BIZUDGothic-Bold.ttf"
  font "morisawa-biz-ud-gothic-fonts/fonts/ttf/BIZUDPGothic-Bold.ttf"
  font "morisawa-biz-ud-gothic-fonts/fonts/ttf/BIZUDGothic-Regular.ttf"
  font "morisawa-biz-ud-gothic-fonts/fonts/ttf/BIZUDPGothic-Regular.ttf"
end
