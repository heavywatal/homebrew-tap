cask "font-morisawa-biz-ud-mincho" do
  version "1.0.0"
  sha256 "3a54c9c6254bcfd683ba259e3a3db2d4133ec975639cf418a226b70efcbba896"

  url "https://github.com/googlefonts/morisawa-biz-ud-mincho/releases/download/v#{version}-correctedBuild/morisawa-biz-ud-mincho-fonts.zip"
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
