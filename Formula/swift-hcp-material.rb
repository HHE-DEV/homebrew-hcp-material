class SwiftHcpMaterial < Formula
  desc "Command-line tool for updating HCP materials"
  homepage "https://github.com/HHE-DEV/swift-hcp-material"
  url "https://github.com/HHE-DEV/swift-hcp-material/releases/tag/0.1.0"
  sha256 "84d965fae2bd60c29ecaf94bdeb43bb65263c094bd93f35e62d894c092ae1a8b"
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
