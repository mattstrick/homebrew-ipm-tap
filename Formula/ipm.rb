# typed: false
# frozen_string_literal: true

class Ipm < Formula
  desc "Package manager for JavaScript (npm fork)"
  homepage "https://github.com/mattstrick/ipm-cli"
  url "https://github.com/mattstrick/ipm-cli/archive/refs/tags/v11.10.1.tar.gz"
  sha256 "d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed"
  license "Artistic-2.0"

  depends_on "node"
  depends_on "python" => :build # for node-gyp in dependency tree

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match "11.10.1", shell_output("#{bin}/ipm --version")
  end
end
