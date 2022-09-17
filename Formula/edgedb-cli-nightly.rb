class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.1.0-dev.845"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.845+5480b44?edgedb.nightly",
        using: :nounzip
      sha256 "b9bbe0e5680394182cdf0f0fced434fe4dbb69a73c46d4486dfb6ac474838f92"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.845+5480b44?edgedb.nightly",
        using: :nounzip
      sha256 "4bffafeb6fea64608e61e894b178c50e6fd4fb21746e73f944338091b9a43fbd"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.845+4f0b071?edgedb.nightly",
        using: :nounzip
      sha256 "63d21e74ad6555950b56145be8b1c50deb46ff7dcb3c22174e288ff9654d7fd2"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.845+ff21091?edgedb.nightly",
        using: :nounzip
      sha256 "f899305bd4100ee3a5d1a75a7bc70930ba6e086bd44e4a4bee080150fdc37c3e"
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
