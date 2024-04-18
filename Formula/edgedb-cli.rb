class EdgedbCli < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "4.1.1"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin/edgedb-cli-4.1.1+a774177",
        using: :nounzip
      sha256 "756d72c97f1d2089eb18bd488d54cc7558fe4678659d83be73a473010f2bda02"

      def install
        bin.install "edgedb-cli-4.1.1+a774177" => "edgedb"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin/edgedb-cli-4.1.1+e89e36b",
        using: :nounzip
      sha256 "bd5748c4ec6977e99e8356221425a951e1d1a5c07d299ae37cfeebbffaa0169c"

      def install
        bin.install "edgedb-cli-4.1.1+e89e36b" => "edgedb"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl/edgedb-cli-4.1.1+0fdb149",
        using: :nounzip
      sha256 "facda1d7e272560dc51c16b07b01d0a1d3f10f68f44bb980599bbe0eb4c5f906"

      def install
        bin.install "edgedb-cli-4.1.1+0fdb149" => "edgedb"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl/edgedb-cli-4.1.1+1504ebf",
        using: :nounzip
      sha256 "4df5e9b331a1bb10c796819b09648d973da048d52573c14ecfcb82b9e40bddad"

      def install
        bin.install "edgedb-cli-4.1.1+1504ebf" => "edgedb"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb", "--version"
  end
end
