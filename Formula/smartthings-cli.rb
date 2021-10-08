require "language/node"

class SmartthingsCli < Formula
  desc "CLI for developing with SmartThings"
  homepage "https://github.com/SmartThingsCommunity/smartthings-cli"
  url "https://registry.npmjs.org/@smartthings/cli/-/cli-0.0.0-pre.31.tgz"
  sha256 "4998fd9b988ebe56017ce04cd9e3546f7c531139319fd049bc60975d251aa262"
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
