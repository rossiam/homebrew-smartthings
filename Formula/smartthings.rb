class Smartthings < Formula
  desc "CLI for developing with SmartThings"
  homepage "https://github.com/SmartThingsCommunity/smartthings-cli"
  url "https://registry.npmjs.org/@smartthings/cli/-/cli-0.0.0-pre.31.tgz"
  sha256 "4998fd9b988ebe56017ce04cd9e3546f7c531139319fd049bc60975d251aa262"
  license "Apache-2.0"

  depends_on "rossiam/smartthings/smartthings-node" => "16.11.0"

  def install
    # inreplace "bin/smartthings", /^CLIENT_HOME=/, "export SMARTTHINGS_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    inreplace "bin/smartthings", "\"$DIR/node\"", Formula["smartthings-node"].opt_bin/"node"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/smartthings"

    bash_completion.install libexec/"node_modules/@smartthings-cli/plugin-autocomplete/autocomplete/brew/bash" => "smartthings"
    zsh_completion.install libexec/"node_modules/@smartthings-cli/plugin-autocomplete/autocomplete/brew/zsh/_smartthings"
  end

  def caveats; <<~EOS
    To use the SmartThing CLI's autocomplete --
      Via homebrew's shell completion:
        1) Follow homebrew's install instructions https://docs.brew.sh/Shell-Completion
            NOTE: For zsh, as the instructions mention, be sure compinit is autoloaded
                  and called, either explicitly or via a framework like oh-my-zsh.
        2) Then run
          $ smartthings autocomplete --refresh-cache
      OR
      Use our standalone setup:
        1) Run and follow the install steps:
          $ smartthings autocomplete
  EOS
  end

  test do
    version_info = pipe_output("#{bin}/smartthings --version").split[0]
    assert version_info == "@smartthings/cli/0.0.0-pre.31"
  end
end
