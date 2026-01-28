cask "jbrowse2" do
  version "4.1.3"
  sha256 "b07faf9e28790a581dfe57a70c1fbd8535a74f1546c84e4d98ae822d675fe536"

  url "https://github.com/GMOD/jbrowse-components/releases/download/v#{version}/jbrowse-desktop-v#{version}-mac.dmg",
      verified: "github.com/GMOD/jbrowse-components/"
  name "JBrowse 2"
  desc "Next-generation genome browser"
  homepage "https://jbrowse.org/jb2/"

  livecheck do
    url :url
    strategy :github_latest
  end

  deprecate! date: "2026-01-28", because: "is superceded", replacement: "jbrowse"

  conflicts_with cask: "jbrowse"
  depends_on macos: ">= :monterey"

  app "JBrowse 2.app"

  zap trash: [
    "~/Library/Application Support/@jbrowse",
    "~/Library/Preferences/org.jbrowse2.app.plist",
  ]
end
