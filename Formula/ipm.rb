# typed: false
# frozen_string_literal: true

class Ipm < Formula
  desc "Package manager for JavaScript"
  homepage "https://github.com/mattstrick/ipm-cli"
  url "https://github.com/mattstrick/ipm-cli/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "513151d86029b8697e5ae912d247546d01c2b5b8e439309a8f70c158fdbfad07"
  license "MIT"

  depends_on "node"

  def install
    libexec.install "bin", "lib", "package.json"
    (bin/"ipm").write <<~EOS
      #!/bin/bash
      exec "#{Formula["node"].opt_bin}/node" "#{libexec}/bin/ipm.js" "$@"
    EOS
    chmod 0755, bin/"ipm"
  end

  test do
    assert_match "0.2.0", shell_output("#{bin}/ipm --version")
  end
end
