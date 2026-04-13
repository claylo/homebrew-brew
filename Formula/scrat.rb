# typed: true
# frozen_string_literal: true

class Scrat < Formula
  desc "Release management tooling focused on sanity retention"
  homepage "https://github.com/claylo/scrat"
  version "0.1.3"
  license "Apache-2.0 OR MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/claylo/scrat/releases/download/v0.1.3/scrat-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "eb5fc87affb0c4733e6079392d759b3eeeee4e3073a4e7d092f7ebe482f8ec7a"
    else
      url "https://github.com/claylo/scrat/releases/download/v0.1.3/scrat-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "ced20a11af32b96b01622b091daa6509147162e4be70cf1bdf6e46ee7d4cb89f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/claylo/scrat/releases/download/v0.1.3/scrat-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "aafe3faa00670e0793d71da39ab54483cfd7931c119887cc1aa4c9d37c3a532d"
    else
      url "https://github.com/claylo/scrat/releases/download/v0.1.3/scrat-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "584b5d6438b5f9afe26fe348b953b67d3a060f71edb10f47f17fe97117039494"
    end
  end

  def install
    bin.install "bin/scrat"
    man1.install Dir["share/man/man1/*.1"]
    bash_completion.install "share/completions/scrat.bash" => "scrat"
    zsh_completion.install "share/completions/_scrat"
    fish_completion.install "share/completions/scrat.fish"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/scrat --version-only")
  end
end
