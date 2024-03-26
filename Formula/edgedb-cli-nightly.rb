class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "4.3.0-dev.1117"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-4.3.0-dev.1117+2dfb53b",
        using: :nounzip
      sha256 "16cb3f86391011774e2d9fcf90342e58f9d67e6e25acab5226013334ab963c21"

      def install
        bin.install "edgedb-cli-4.3.0-dev.1117+2dfb53b" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-4.3.0-dev.1117+8677d7b",
        using: :nounzip
      sha256 "c7f2244b10245a2c798d81a48ee318ef9ad4f70fa73742e315c0da5e3a337608"

      def install
        bin.install "edgedb-cli-4.3.0-dev.1117+8677d7b" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-4.3.0-dev.1117+ff67023",
        using: :nounzip
      sha256 "2f28fd1e7fd3e5f7af0d7dc6892eae3375efbbd2082965cfeba077dac32f8054"

      def install
        bin.install "edgedb-cli-4.3.0-dev.1117+ff67023" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-4.3.0-dev.1117+e2cad25",
        using: :nounzip
      sha256 "ec1cc58ac9f1b3130108310a59be5d2a52cfe55dfce757d7bc23f40f7abf0e79"

      def install
        bin.install "edgedb-cli-4.3.0-dev.1117+e2cad25" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
