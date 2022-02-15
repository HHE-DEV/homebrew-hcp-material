class SwiftHcpMaterial < Formula
  desc "Command-line tool for updating HCP materials"
  homepage "https://github.com/HHE-DEV/swift-hcp-material"
  url "https://github.com/HHE-DEV/swift-hcp-material/releases/tag/0.1.0"
  sha256 "a9e90a1a79ba6ca8b3707af6a79e36d1f6051cd78e2c5d793b100f16391dbfeb"
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
