class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.3.0-dev.895"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.3.0-dev.895+1d1772a?edgedb.nightly",
        using: :nounzip
      sha256 "60efad6c2913f0fdc32613f410c8c13730a2523c4e3e535d794c06dddcd276b5"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.3.0-dev.895+395ef7d?edgedb.nightly",
        using: :nounzip
      sha256 "8701a2bd695842fb83fb1aab6f431a5d1baa98bdfad7414e374b56409bd984a2"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.3.0-dev.895+0eea614?edgedb.nightly",
        using: :nounzip
      sha256 "5ab8c74dec0368893093c3bcbe87e49212592c1295d58d2cadbb910466ba1c4d"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-2.3.0-dev.895+40238cc?edgedb.nightly",
        using: :nounzip
      sha256 "b1a25b812234317975a966dcdb1e96a3cee25c5629ac40099f3ecb051bcdc554"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  def install
    bin.install "edgedb.nightly" => "edgedb-nightly"
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
