# typed: false
# frozen_string_literal: true

class Ipm < Formula
  desc "Package manager for JavaScript"
  homepage "https://github.com/mattstrick/ipm-cli"
  url "https://github.com/mattstrick/ipm-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "fc1d84930bf817b6da5b77b270e4461d946008659947be78839bf1bee5e81973"
  license "MIT"

  depends_on "node"

  def install
    libexec.install "bin", "lib", "package.json"
    (bin/"ipm").write_env_script libexec/"bin/ipm.js", PATH: "#{Formula["node"].opt_bin}:$PATH"
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/ipm --version")
  end
end
