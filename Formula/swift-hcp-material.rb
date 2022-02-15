class SwiftHcpMaterial < Formula
  desc "Command-line tool for updating HCP materials"
  homepage "https://github.com/HHE-DEV/swift-hcp-material"
  url "https://github.com/HHE-DEV/swift-hcp-material/archive/refs/tags/0.1.3.tar.gz"
  sha256 "aab8e69285fb18c52efd5d3562b326c955e7a1ce8771c21f8eb84ef2f41cf525"
  license "MIT"

  depends_on xcode: ["10.15", :build]

  def install
    system "make", "install", "prefix=#{prefix}"
    (bash_completion/"hcp-material").write `#{bin}/hcp-material --generate-completion-script bash`
    (fish_completion/"hcp-material.fish").write `#{bin}/hcp-material --generate-completion-script fish`
    (zsh_completion/"_hcp-material").write `#{bin}/hcp-material --generate-completion-script zsh`
  end

  test do
    system "#{bin}/hcp-material", "--version"
  end
end
