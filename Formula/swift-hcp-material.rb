class SwiftHcpMaterial < Formula
  desc "Command-line tool for updating HCP materials"
  homepage "https://github.com/HHE-DEV/swift-hcp-material"
  url "https://github.com/HHE-DEV/swift-hcp-material/archive/refs/tags/0.1.2.tar.gz"
  sha256 "9f0a476030c95a3ad5810dd2ce41c0fc054c62bd554ef8c82dfbbf064dd7bf48"
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
