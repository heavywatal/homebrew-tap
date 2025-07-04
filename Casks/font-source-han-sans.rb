cask "font-source-han-sans" do
  version "2.005"
  sha256 "a024cf1759494847cd47aae4379bcb3dc530017c709f3f503ee0ed918dd92952"

  url "https://github.com/adobe-fonts/source-han-sans/releases/download/#{version}R/01_SourceHanSans.ttc.zip"
  name "Source Han Sans"
  name "思源黑體"
  name "源ノ角ゴシック"
  name "본고딕"
  desc "OpenType/CFF Pan-CJK fonts"
  homepage "https://github.com/adobe-fonts/source-han-sans"

  livecheck do
    url "https://github.com/adobe-fonts/source-han-sans/releases/latest"
    strategy :page_match
    regex(%r{tag/(\d+(?:\.\d+)*)}i)
  end

  font "SourceHanSans.ttc"
end
