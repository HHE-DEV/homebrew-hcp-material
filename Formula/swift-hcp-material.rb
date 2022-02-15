class SwiftHcpMaterial < Formula
  desc "Command-line tool for updating HCP materials"
  homepage "https://github.com/HHE-DEV/swift-hcp-material"
  url "https://github.com/HHE-DEV/swift-hcp-material/archive/refs/tags/0.1.0.tar.gz"
  sha256 "6d6a2744ccebdf3074375012d8049e4d35df71b1982d4f9cc4d9f00a1e2bbb87"
  license "MIT"

  depends_on xcode: ["10.15", :build]

  def install
    system "make", "install", "prefix=#{prefix}"
    (bash_completion/"hcp-material").write `#{bin}/hcp-material --generate-completion-script bash`
    (fish_completion/"hcp-material.fish").write `#{bin}/hcp-material --generate-completion-script fish`
    (zsh_completion/"_hcp-material").write `#{bin}/hcp-material --generate-completion-script zsh`
  end

  test do
    system "#{bin}/hcp-material-parser", "--version"
  end
end
