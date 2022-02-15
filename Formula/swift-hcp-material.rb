class SwiftHcpMaterial < Formula
  desc "Command-line tool for updating HCP materials"
  homepage "https://github.com/HHE-DEV/swift-hcp-material"
  url "https://github.com/HHE-DEV/swift-hcp-material/archive/refs/tags/0.1.3.tar.gz"
  sha256 "aab8e69285fb18c52efd5d3562b326c955e7a1ce8771c21f8eb84ef2f41cf525"
  license "MIT"

  bottle do
    root_url "https://github.com/HHE-DEV/homebrew-hcp-material/releases/download/swift-hcp-material-0.1.3"
    sha256 cellar: :any_skip_relocation, big_sur: "449c2e49708aa5c324ea35a46780890a30908ab8605843df9756662ed62333a7"
  end

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
