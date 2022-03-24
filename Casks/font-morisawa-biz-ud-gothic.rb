cask "font-morisawa-biz-ud-gothic" do
  version "1.0.0"
  sha256 "409fae682d033e31601addb61754e2b14b4df4c6deeea527fddd4b523ab34d35"

  url "https://github.com/googlefonts/morisawa-biz-ud-gothic/releases/download/v#{version}-correctedBuild/morisawa-biz-ud-gothic-fonts.zip"
  name "Morisawa BIZ UDGothic"
  desc "BIZ UD Gothic is a universal design typeface designed to be easy to read and ideal for education and business documentation."
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
