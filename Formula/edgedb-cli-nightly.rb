class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.2.0-dev.872"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.2.0-dev.872+578cd27?edgedb.nightly",
        using: :nounzip
      sha256 "c9a255cce109bcb4dcc090e7b17cdb43d8830e77747a9b849124a747c2667dee"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.2.0-dev.872+5ebde4a?edgedb.nightly",
        using: :nounzip
      sha256 "e18cee42cc8edab91fb5849db34eebcf2a2bd642325c942f29778f2eed9c0992"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.2.0-dev.872+02b0207?edgedb.nightly",
        using: :nounzip
      sha256 "9abfc6958b24c7d2fe60740ffba8c86a1b01056ce4dbf95c83f21a70d78e70b3"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-2.2.0-dev.872+5b9328f?edgedb.nightly",
        using: :nounzip
      sha256 "2526b211fb314a96adccf1d55354a917bdb3ff8fff69a6e05f4860d59e24bba9"
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
