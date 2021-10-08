class SmartthingsNode < Formula
  desc "Node dependency for SmartThings CLI"
  homepage "https://github.com/SmartThingsCommunity/smartthings-cli"
  # url "https://nodejs.org/download/release/v12.21.0/node-v12.21.0-darwin-x64.tar.xz"
  url "https://nodejs.org/download/release/v16.11.0/node-v16.11.0-darwin-x64.tar.xz"
  # version "12.21.0"
  version "16.11.0"
  # sha256 "4184cc5412cdf256996aa7f559859abc355b48f03144349cf8531b6bf0526f49"
  sha256 "cf8a5db0b04f12996142b7f0beca07fc194e3d5b86ef2abae0ea9b974dc9f3bf"
  keg_only "smartthings-node is only used by the SmartThings CLI"

  def install
    bin.install buildpath/"bin/node"
  end

  def test
    output = system bin/"node", "version"
    assert output.strip == "v#{version}"
  end
end
