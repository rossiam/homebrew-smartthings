require "language/node"

class SmartthingsCli < Formula
  desc "CLI for developing with SmartThings"
  homepage "https://github.com/SmartThingsCommunity/smartthings-cli"
  url "https://registry.npmjs.org/@smartthings/cli/-/cli-0.0.0-pre.30.tgz"
  sha256 "7a9f2ec0a6c67f9cbef44ba4571a6050a1a65a5b04c7800879ffda71ee8a59bb"
  license "Apache-2.0"

  depends_on "node@16"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    version_info = pipe_output("#{bin}/smartthings --version").split[0]
    assert version_info == "@smartthings/cli/0.0.0-pre.30"
  end
end
