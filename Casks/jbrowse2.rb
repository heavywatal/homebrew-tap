cask "jbrowse2" do
  version "3.0.1"
  sha256 "3e1a1f3dd2be24e9d405dbd8534830526a675383e5837048199b51672179e63e"

  url "https://github.com/GMOD/jbrowse-components/releases/download/v#{version}/jbrowse-desktop-v#{version}-mac.dmg",
      verified: "github.com/GMOD/jbrowse-components/"
  name "JBrowse 2"
  desc "Next-generation genome browser"
  homepage "https://jbrowse.org/jb2/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "JBrowse 2.app"

  zap trash: [
    "~/Library/Application Support/@jbrowse",
    "~/Library/Preferences/org.jbrowse2.app.plist",
  ]
end
