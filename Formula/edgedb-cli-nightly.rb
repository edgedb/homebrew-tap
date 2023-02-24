class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.0.0-dev.914"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.914+2a0d060?edgedb.nightly",
        using: :nounzip
      sha256 "5a96867d6a2d982355d07051ddeed773e30277dadcc6787cb2ce7dce37ac7f45"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.914+6102f26?edgedb.nightly",
        using: :nounzip
      sha256 "65d3672af1a008aafe5c52cae49e7fc14580d6f8a87a030bffdb26470ccd5d52"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.914+04d51ab?edgedb.nightly",
        using: :nounzip
      sha256 "b205974632dcd11dc7e961eab023a01eebb709343ac6855df97b8b16f8385c1b"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.914+368bed5?edgedb.nightly",
        using: :nounzip
      sha256 "99b005cc4ebc652a7c415388eb0a9a9352c72314fe2cdf804ca5e628b45da163"
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
