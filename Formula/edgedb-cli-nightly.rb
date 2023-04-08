class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.0.0-dev.946"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.946+173742a?edgedb.nightly",
        using: :nounzip
      sha256 "93643ccf258d139e1f15d4aec42b27b0eca9673f71c64cd4d764d95af7b0885e"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.946+565cbbe?edgedb.nightly",
        using: :nounzip
      sha256 "594b7513694f1ce7618b4c4a9f73d95a67fc17e01cd542b5674969c748c3a893"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.946+05f0c03?edgedb.nightly",
        using: :nounzip
      sha256 "0048feb42b3e9b64b30f6d7a4e11d6347bb37514c3600f1f1ec29a51bf8081dd"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.946+7b0175d?edgedb.nightly",
        using: :nounzip
      sha256 "108be43429391bb49529eb151803dc8222e235a3a42445e91a7f5a8f2cc61a38"
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
