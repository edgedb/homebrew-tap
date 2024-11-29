class EdgedbCli < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "6.0.0"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin/edgedb-cli-6.0.0+5eb4714",
        using: :nounzip
      sha256 "9264a8ad1015e82024ff34ca78da32511b4b7b3e9900123b339c183c5912642c"

      def install
        bin.install "edgedb-cli-6.0.0+5eb4714" => "edgedb"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin/edgedb-cli-6.0.0+5eb4714",
        using: :nounzip
      sha256 "1e913c4bc1def7aa26df599d083c12f324ca5379ef9b73f3330a01608f5995d8"

      def install
        bin.install "edgedb-cli-6.0.0+5eb4714" => "edgedb"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl/edgedb-cli-6.0.0+aa87946",
        using: :nounzip
      sha256 "4f5f942b808395f5580d871c3ea7999f538e6738db344afed2b71772bda4d8d2"

      def install
        bin.install "edgedb-cli-6.0.0+aa87946" => "edgedb"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl/edgedb-cli-6.0.0+faef81a",
        using: :nounzip
      sha256 "279da752ba1d7b774e382b526fdac7fe98f2f5f12221018a8f64b29d37e0bc82"

      def install
        bin.install "edgedb-cli-6.0.0+faef81a" => "edgedb"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb", "--version"
  end
end
