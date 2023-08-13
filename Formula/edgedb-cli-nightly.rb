class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.5.0-dev.1026"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.5.0-dev.1026+1093243",
        using: :nounzip
      sha256 "93c208bf8e0c8c24cdf5128745bce5ac1145e7d4ed91298e9d5f9559c2cc4a62"

      def install
        bin.install "edgedb-cli-3.5.0-dev.1026+1093243" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.5.0-dev.1026+1545d8f",
        using: :nounzip
      sha256 "f5ab0fbe9c124399292a23cbe4ba54fdb235dfce8d29bee45f66dbbbd18b5b86"

      def install
        bin.install "edgedb-cli-3.5.0-dev.1026+1545d8f" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.5.0-dev.1026+2409238",
        using: :nounzip
      sha256 "6bd1e344d66ae539c00eda0467e4ddd30f1e937db5bc21c5109bb8f8f693832a"

      def install
        bin.install "edgedb-cli-3.5.0-dev.1026+2409238" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.5.0-dev.1026+12b3e6c",
        using: :nounzip
      sha256 "a7ff7282669031741032ee78359b8064e585678f98734d193712b049ad1a4deb"

      def install
        bin.install "edgedb-cli-3.5.0-dev.1026+12b3e6c" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
