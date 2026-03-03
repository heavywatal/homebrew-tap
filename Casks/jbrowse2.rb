cask "jbrowse2" do
  version "4.1.13"
  sha256 "8e2988d097b536745ece3886d75c6e7e9e06c72d1179ef772d2bc97846d7949f"

  url "https://github.com/GMOD/jbrowse-components/releases/download/v#{version}/jbrowse-desktop-v#{version}-mac.dmg",
      verified: "github.com/GMOD/jbrowse-components/"
  name "JBrowse 2"
  desc "Next-generation genome browser"
  homepage "https://jbrowse.org/jb2/"

  livecheck do
    url :url
    strategy :github_latest
  end

  deprecate! date: "2026-01-28", because: "is superceded", replacement_formula: "jbrowse"

  conflicts_with cask: "jbrowse"
  depends_on macos: ">= :monterey"

  app "JBrowse 2.app"

  zap trash: [
    "~/Library/Application Support/@jbrowse",
    "~/Library/Preferences/org.jbrowse2.app.plist",
  ]
end
