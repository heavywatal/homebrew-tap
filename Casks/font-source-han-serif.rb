cask "font-source-han-serif" do
  version "2.000"
  sha256 "443832c1a6fb8304fe6013bb175289bca3afd04ff7fbb662fe9425f940ec19c3"

  url "https://github.com/adobe-fonts/source-han-serif/releases/download/#{version}R/SourceHanSerif.ttc.zip"
  name "Source Han Serif"
  name "思源宋體"
  name "源ノ明朝"
  name "본명조"
  desc "OpenType/CFF Pan-CJK fonts"
  homepage "https://github.com/adobe-fonts/source-han-serif"

  livecheck do
    url "https://github.com/adobe-fonts/source-han-serif/releases/latest"
    strategy :page_match
    regex(%r{tag/(\d+(?:\.\d+)*)}i)
  end

  font "SourceHanSerif.ttc"
end
