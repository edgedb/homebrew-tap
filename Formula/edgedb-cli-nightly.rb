class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.1.0-dev.851"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.851+1691b4b?edgedb.nightly",
        using: :nounzip
      sha256 "fdd8876741d8758f8a05d4203c051c2c1f0dace1357bcaf4d744154a1f844cdc"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.851+1691b4b?edgedb.nightly",
        using: :nounzip
      sha256 "d4cc33d9657bc9efa0a404ed36193d9cedf5e184f2041a655572a32f2f5a3a20"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.851+1ad8ec3?edgedb.nightly",
        using: :nounzip
      sha256 "574064f31d62f755ba823ffd59ebeb1e36f9d798094bdfbcfb8afb635e7ff361"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.851+2239bd0?edgedb.nightly",
        using: :nounzip
      sha256 "eea4119281f0d9089a8fb9c3a881ac63a5ffcf64b7e06e523c17afb19a5f59dc"
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
