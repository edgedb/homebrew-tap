class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.3.0-dev.905"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.3.0-dev.905+0c7f7b1?edgedb.nightly",
        using: :nounzip
      sha256 "d611d9f98952f005a775ab7965b488c86fe1eba2ff28c397a6ab25c0b73b9a74"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.3.0-dev.905+089748d?edgedb.nightly",
        using: :nounzip
      sha256 "7f878d77f6e3c57d11d9c15533631b0b335669a42cd019e9ea6b0e35fdc69134"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.3.0-dev.905+2589421?edgedb.nightly",
        using: :nounzip
      sha256 "69d6a88eaeef7aa9f9e85c136628976df643421f5481f7d28b6eb3b52dc328c5"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-2.3.0-dev.905+0c7f7b1?edgedb.nightly",
        using: :nounzip
      sha256 "67de40f06718a9e70ade9fe0208dd964d3fe0cf8453d9f56d9a500b0e929aa7c"
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
