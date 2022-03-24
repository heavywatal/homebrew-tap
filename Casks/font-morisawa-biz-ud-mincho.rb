cask "font-morisawa-biz-ud-mincho" do
  version "1.001"
  sha256 "d378e752b9f670d619872d4abbd73c94568ede5f7daff7af9893b9229a3f7fb5"

  url "https://github.com/googlefonts/morisawa-biz-ud-mincho/releases/download/v#{version}/morisawa-biz-ud-mincho-fonts.zip"
  name "Morisawa BIZ UDMincho"
  desc "BIZ UD Mincho is a universal design typeface designed to be easy to read and ideal for education and business documentation."
  homepage "https://github.com/googlefonts/morisawa-biz-ud-mincho/"

  livecheck do
    url "https://github.com/googlefonts/morisawa-biz-ud-mincho/releases/latest"
    strategy :page_match
    regex(%r{tag/(\d+(?:\.\d+)*)}i)
  end

  font "morisawa-biz-ud-mincho-fonts/fonts/ttf/BIZUDMincho-Regular.ttf"
  font "morisawa-biz-ud-mincho-fonts/fonts/ttf/BIZUDPMincho-Regular.ttf"
end
