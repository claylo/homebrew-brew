# typed: true
# frozen_string_literal: true

class Bito < Formula
  desc "Quality gate tooling for building-in-the-open artifacts"
  homepage "https://github.com/claylo/bito"
  version "2.0.0"
  license "Apache-2.0 OR MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/claylo/bito/releases/download/v2.0.0/bito-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "c16102d12c4fd2231183902e13eb50f52c185d05296afc9669b8f336f2a95ace"
    else
      url "https://github.com/claylo/bito/releases/download/v2.0.0/bito-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "e739e1f4753f6ebf2a8855c1e18407f3bf2b9d2a123f4bece2a2283bce9df381"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/claylo/bito/releases/download/v2.0.0/bito-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7eb89bbbd9a12472b1ec292cfd1d4ed487619d99fea855520ea5d2a25bc55b1f"
    else
      url "https://github.com/claylo/bito/releases/download/v2.0.0/bito-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0abdc7ff2a9a4d72d118f76b30dd9fa0605fcd143c2567d0739276e0c7a4c0ce"
    end
  end

  def install
    bin.install "bin/bito"
    man1.install Dir["share/man/man1/*.1"]
    bash_completion.install "share/completions/bito.bash" => "bito"
    zsh_completion.install "share/completions/_bito"
    fish_completion.install "share/completions/bito.fish"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/bito --version-only")
  end
end
