cask "jbrowse2" do
  version "2.18.0"
  sha256 "bb57344ebe6f69d393c21dba200ec01c67d408551ece6159a2797626752b6ce6"

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
