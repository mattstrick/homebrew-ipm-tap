# typed: false
# frozen_string_literal: true

class Ipm < Formula
  desc "Package manager for JavaScript"
  homepage "https://github.com/mattstrick/ipm-cli"
  url "https://github.com/mattstrick/ipm-cli/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "256e9b85371c7bd8719ecc2ef5d124e23beda984f6c8aa078e120dc94a5c980f"
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
