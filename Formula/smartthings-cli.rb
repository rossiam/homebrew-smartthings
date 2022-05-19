require "language/node"

class SmartthingsCli < Formula
  desc "CLI for developing with SmartThings"
  homepage "https://github.com/SmartThingsCommunity/smartthings-cli"
  version '1.0.0-beta.6'
  url "file:///dev/null"
  sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  license "Apache-2.0"

  depends_on "node@16"

  def install
    # puts "libexec = #{libexec}"
    # args_array = Language::Node.std_npm_install_args(libexec)
    # puts "args_array = #{args_array}"
    # args = args_array.join(' ')
    # puts "args = #{args}"
    # stdout, stderr, status = Open3.capture3("pwd")
    # puts("pwd = #{stdout}")
    # stdout = Open3.capture3("which node")
    node_bin = `which node`
    puts("node at: #{node_bin}")
    # stdout, stderr, status = Open3.capture3("npm --version")
    # puts("npm version = #{stdout}")
    (libexec/"lib").mkpath
    # puts "*** AT START: npm ls -g\n\n"
    # stdout, stderr, status = Open3.capture3("npm ls --global --prefix=#{libexec}")
    # puts(stdout)
    # system "npm", "ls", "--global", "--prefix=#{libexec}"
    # puts "\n\ninstalling typescript\n\n"
    # system "npm", "install", "--global", "--prefix=#{libexec}", "typescript@4.5.4"
    # puts "\n\n*** AFTER TS INSTALL: npm ls -g\n\n"
    # stdout, stderr, status = Open3.capture3("npm ls --global --prefix=#{libexec}")
    # puts(stdout)
    # system "npm", "ls", "--global", "--prefix=#{libexec}"
    # puts "\n\ninstalling oclif\n\n"
    # system "npm", "install", "--global", "--prefix=#{libexec}", "oclif"
    # puts "\n\n*** AFTER oclif INSTALL: npm ls -g\n\n"
    # stdout, stderr, status = Open3.capture3("npm ls --global --prefix=#{libexec}")
    # puts(stdout)
    # system "npm", "ls", "--global", "--prefix=#{libexec}"
    # puts "\n\n*** installing now:\n\n"
    # stdout, stderr, status = Open3.capture3("npm install #{args}")
    system "npm", "install", "--global", "--prefix=#{libexec}", "@smartthings/cli@1.0.0-beta.6"
    # stdout, stderr, status = Open3.capture3("npm install #{Language::Node.std_npm_install_args(libexec).join(' ')}")
    # puts "\n\ninstall status = #{status}"
    # puts "\n\ninstall stdout:\n#{stdout}"
    # puts "\n\ninstall stderr:\n#{stderr}"
    # system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    # puts "*** finished npm install; doing link"
    inreplace "#{libexec}/bin/smartthings", "#!/usr/bin/env node", "#!#{node_bin}"
    bin.install_symlink Dir["#{libexec}/bin/smartthings"]
  end

  test do
    version_info = pipe_output("#{bin}/smartthings --version").split[0]
    assert version_info == "@smartthings/cli/1.0.0-beta.6"
  end
end
