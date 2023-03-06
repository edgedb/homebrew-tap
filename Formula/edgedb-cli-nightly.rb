class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.0.0-dev.922"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.922+11ca1c3?edgedb.nightly",
        using: :nounzip
      sha256 "86208f653d9049751fb5ed3802f85fe1a6ecd8900622c2170259ee8401993882"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.922+1e207d6?edgedb.nightly",
        using: :nounzip
      sha256 "fd491c0c164146607f418bc09233c92125901632b8220f925ce4cea0445c6e09"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.922+12fc6fa?edgedb.nightly",
        using: :nounzip
      sha256 "0bf311c95f9595bdd5c4af0ef48beae148305dcfafc4d11f849443eca8d96f4b"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.922+11ca1c3?edgedb.nightly",
        using: :nounzip
      sha256 "bf9b20c07a48ac7c04a6d0d74fd000c3ec01e8931166be32ef1b2875b6efe64f"
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
