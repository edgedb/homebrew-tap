class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "5.6.0-dev.1220"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-5.6.0-dev.1220+827ee0a",
        using: :nounzip
      sha256 "b93071fbe64327e4919cfe727f37272eeb9e37058c33becee506cb1cf30c575b"

      def install
        bin.install "edgedb-cli-5.6.0-dev.1220+827ee0a" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-5.6.0-dev.1220+827ee0a",
        using: :nounzip
      sha256 "ff16df662210f90568d2700c7f5f7fdc08ba8b3a926791b241709be86f7b989c"

      def install
        bin.install "edgedb-cli-5.6.0-dev.1220+827ee0a" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-5.6.0-dev.1220+feb5a8d",
        using: :nounzip
      sha256 "a94c12f9dc9597d449aefc2938a432827973b1e054d8852890e9315c12b51f89"

      def install
        bin.install "edgedb-cli-5.6.0-dev.1220+feb5a8d" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-5.6.0-dev.1220+e4235ac",
        using: :nounzip
      sha256 "3a9a534d9a922e6bd64ec349424596b90b22cc91543b5fca20e35027ab4c0da1"

      def install
        bin.install "edgedb-cli-5.6.0-dev.1220+e4235ac" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
