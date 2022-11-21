class EdgedbCli < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.2.5"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin/edgedb-cli-2.2.5+cd928ff?edgedb.release",
        using: :nounzip
      sha256 "95ca5f68805869d516339e4e039a707dffb82c42f4c2e12b2dda3841e8f80455"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin/edgedb-cli-2.2.5+67a3fb9?edgedb.release",
        using: :nounzip
      sha256 "248bfa8488c415150641ce64723761c0f17b6daf161bcd434862dc2975149157"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl/edgedb-cli-2.2.5+22f1ba4?edgedb.release",
        using: :nounzip
      sha256 "e92ef4700fde89005f87046ceb9bc570692bdbf504f4bae4677f670d6b1f5378"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl/edgedb-cli-2.2.5+dcbdfc0?edgedb.release",
        using: :nounzip
      sha256 "6f062fadcab185ed9b3c89afaa44219c1652eeb2f765c67d26eb26c1e56b65ad"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  def install
    bin.install "edgedb.release" => "edgedb"
  end

  test do
    system "#{bin}/edgedb", "--version"
  end
end
