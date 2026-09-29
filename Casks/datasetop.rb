cask "datasetop" do
  arch arm: "aarch64", intel: "x64"

  version "0.6.0"
  sha256 arm: "f3f57d976222b55c9b3a3a5628d11fa1b092407502754cceee0739b0c7da1753",
         intel: "78d3678c1ea2ddf3d3638ef599f77c11e9c23542bce49a6f575d819466fc7a2c"

  url "https://github.com/arthuqa/datasetop/releases/download/v#{version}/datasetop_#{version}_#{arch}.dmg"
  name "datasetop"
  desc "Chat-first MCP agent for a local folder"
  homepage "https://github.com/arthuqa/datasetop"

  livecheck do
    url "https://github.com/arthuqa/datasetop"
    strategy :github_latest
  end

  depends_on macos: :big_sur

  app "datasetop.app"

  caveats <<~EOS
    The macOS build is not notarized. If macOS blocks the first launch, run:

      xattr -dr com.apple.quarantine /Applications/datasetop.app

    or allow it from System Settings -> Privacy & Security -> Open Anyway.
  EOS

  zap trash: [
    "~/Library/Application Support/app.datasetop.desktop",
    "~/Library/Caches/app.datasetop.desktop",
    "~/Library/Saved Application State/app.datasetop.desktop.savedState",
  ]
end
