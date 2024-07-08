cask "jbrowse2" do
  version "2.12.3"
  sha256 "422d159985414b2bcdc5e1f1ff73715ee170bba4162ef56d07a58bc54674bb79"

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
