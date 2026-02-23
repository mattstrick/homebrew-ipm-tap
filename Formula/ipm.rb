# typed: false
# frozen_string_literal: true

class Ipm < Formula
  desc "Package manager for JavaScript"
  homepage "https://github.com/mattstrick/ipm-cli"
  url "https://github.com/mattstrick/ipm-cli/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "99a84af768891ccb129fe948e90a0616f26b70f54ad7923e074c71bac10eef33"
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
    assert_match "0.2.1", shell_output("#{bin}/ipm --version")
  end
end
