class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.3.0-dev.1018"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.3.0-dev.1018+4d3d1cc",
        using: :nounzip
      sha256 "ef89aafdf0728cb68139bd441c3e3edf14a953fa78def6122d569ea0fd00ad0b"

      def install
        bin.install "edgedb-cli-3.3.0-dev.1018+4d3d1cc" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.3.0-dev.1018+00f0d43",
        using: :nounzip
      sha256 "62d592d42ed4d8afb749d2e4618b175c80933efaafb27c811adda42bca6fb2ad"

      def install
        bin.install "edgedb-cli-3.3.0-dev.1018+00f0d43" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.3.0-dev.1018+78a7fa0",
        using: :nounzip
      sha256 "fd4cf69b4c0f5d7088eb8ddb981e47e34cc5dc641460ebd1072a932ddbcb423e"

      def install
        bin.install "edgedb-cli-3.3.0-dev.1018+78a7fa0" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.3.0-dev.1018+14ccd81",
        using: :nounzip
      sha256 "3b7fd4f4fd32b790a7c9390ace3f555d8a7d0e7ece0df6e3450ef3e60f804c13"

      def install
        bin.install "edgedb-cli-3.3.0-dev.1018+14ccd81" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
