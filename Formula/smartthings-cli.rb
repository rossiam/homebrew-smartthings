require "language/node"

class SmartthingsCli < Formula
  desc "CLI for developing with SmartThings"
  homepage "https://github.com/SmartThingsCommunity/smartthings-cli"
  url "https://registry.npmjs.org/@smartthings/cli/-/cli-1.0.0-beta.5.tgz"
  sha256 "e9e0f8c9c73245483b3f0eda4d57e2232fb365ea487ef3c8c4f07f1580476f1f"
  license "Apache-2.0"

  depends_on "node@16"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    version_info = pipe_output("#{bin}/smartthings --version").split[0]
    assert version_info == "@smartthings/cli/0.0.0-pre.31"
  end
end
