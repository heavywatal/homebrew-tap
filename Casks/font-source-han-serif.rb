cask "font-source-han-serif" do
  version "2.003"
  sha256 "6ee689ab57894ae35af604a73e95c372bda0306610ffa179a4708e8cd47a795f"

  url "https://github.com/adobe-fonts/source-han-serif/releases/download/#{version}R/01_SourceHanSerif.ttc.zip"
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

  deprecate! date: "2026-03-04", because: "is superceded", replacement_formula: "font-source-han-serif-vf"

  conflicts_with cask: "font-source-han-serif-vf"

  font "SourceHanSerif.ttc"
end
