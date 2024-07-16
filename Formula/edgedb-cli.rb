class EdgedbCli < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "5.2.1"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin/edgedb-cli-5.2.1+c277e88",
        using: :nounzip
      sha256 "6f40f54d19fc36f61944cc6d07e8d8d8e14585a705118c91cc6db3870a04e77e"

      def install
        bin.install "edgedb-cli-5.2.1+c277e88" => "edgedb"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin/edgedb-cli-5.2.1+c277e88",
        using: :nounzip
      sha256 "d827292c35d98e2581926c2355baad40e0cd72804bbf7bdc9ef9e811d4db81bb"

      def install
        bin.install "edgedb-cli-5.2.1+c277e88" => "edgedb"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl/edgedb-cli-5.2.1+1af98a2",
        using: :nounzip
      sha256 "5c79161150f82f53b3e8366454a3901032af0774de1851aa4e09d47b1814b074"

      def install
        bin.install "edgedb-cli-5.2.1+1af98a2" => "edgedb"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl/edgedb-cli-5.2.1+213dba6",
        using: :nounzip
      sha256 "a31e29c6c8472962a47d98137265c31ca94b00631db1bc66ee8734165c84d727"

      def install
        bin.install "edgedb-cli-5.2.1+213dba6" => "edgedb"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb", "--version"
  end
end
