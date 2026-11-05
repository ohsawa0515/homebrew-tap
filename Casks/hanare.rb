cask "hanare" do
  version "0.1.0"
  sha256 "747138afd6b92e90a8ea3657fcc514978b7de3651d5bd1cfb3a4c4e7abc74b85"

  url "https://github.com/ohsawa0515/hanare/releases/download/v#{version}/Hanare-#{version}.zip"
  name "Hanare"
  desc "Menu bar icon hider with a kyudo archer"
  homepage "https://github.com/ohsawa0515/hanare"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  app "Hanare.app"

  # Hanare shows the icons it hid again when it quits.
  uninstall quit: "io.github.ohsawa0515.Hanare"

  zap trash: "~/Library/Preferences/io.github.ohsawa0515.Hanare.plist"

  caveats <<~EOS
    Hanare is not notarized by Apple, so macOS blocks it the first time.
    Open Hanare once, then allow it in
      System Settings > Privacy & Security > Open Anyway
    After an update, macOS may ask for the file access and Accessibility again.
  EOS
end
