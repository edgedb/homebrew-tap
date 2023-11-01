class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "4.1.0-dev.1061"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-4.1.0-dev.1061+02b35dd",
        using: :nounzip
      sha256 "c3b8eb47da78331b2bbf1466faa2edf67c262d5e28839c443c36fb2322ebd713"

      def install
        bin.install "edgedb-cli-4.1.0-dev.1061+02b35dd" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-4.1.0-dev.1061+96ac4e4",
        using: :nounzip
      sha256 "c4c3c3d1154230d994c15dbd611faf82b5988982f45cbeac56375658602878c2"

      def install
        bin.install "edgedb-cli-4.1.0-dev.1061+96ac4e4" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-4.1.0-dev.1061+e165b74",
        using: :nounzip
      sha256 "16646c7d95c6eec7baa209309827704884c02ba66a0c3f2e2360ff4b1159fc60"

      def install
        bin.install "edgedb-cli-4.1.0-dev.1061+e165b74" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-4.1.0-dev.1061+bb79ad3",
        using: :nounzip
      sha256 "8563b3d17a89597093a2bd08b422a487831322950c491fcf53e5fbf80476a066"

      def install
        bin.install "edgedb-cli-4.1.0-dev.1061+bb79ad3" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
