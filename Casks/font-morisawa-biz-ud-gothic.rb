cask "font-morisawa-biz-ud-gothic" do
  version "1.05"
  sha256 "ca7c1e994b95607974e6ce07115c0e9a3d8217cde52d08a0b5d601b49c25c5fb"

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
