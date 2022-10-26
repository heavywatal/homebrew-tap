cask "font-morisawa-biz-ud-mincho" do
  version "1.05"
  sha256 "6b6a8f73e83bb07d09018a2e79d11c7e4fb65663058ccd7c1720215c2af9b75c"

  url "https://github.com/googlefonts/morisawa-biz-ud-mincho/releases/download/v#{version}/morisawa-biz-ud-mincho-fonts.zip"
  name "Morisawa BIZ UDMincho"
  desc "Universal design typeface designed to be easy to read"
  homepage "https://github.com/googlefonts/morisawa-biz-ud-mincho/"

  livecheck do
    url "https://github.com/googlefonts/morisawa-biz-ud-mincho/releases/latest"
    strategy :page_match
    regex(%r{tag/(\d+(?:\.\d+)*)}i)
  end

  font "morisawa-biz-ud-mincho-fonts/fonts/ttf/BIZUDMincho-Regular.ttf"
  font "morisawa-biz-ud-mincho-fonts/fonts/ttf/BIZUDPMincho-Regular.ttf"
end
