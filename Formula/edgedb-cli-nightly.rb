class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.2.0-dev.1003"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.2.0-dev.1003+281f9d4",
        using: :nounzip
      sha256 "fe5b35885635a666e25ca77d0579a3ed76a2a2e98b132e142fb8d759f18d45a8"

      def install
        bin.install "edgedb-cli-3.2.0-dev.1003+281f9d4" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.2.0-dev.1003+f15f451",
        using: :nounzip
      sha256 "f8444c834b4991627f9e15e92e77cf73a6b00e70d006456cd6d35d9ecc5112da"

      def install
        bin.install "edgedb-cli-3.2.0-dev.1003+f15f451" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.2.0-dev.1003+8444fe3",
        using: :nounzip
      sha256 "a9e81ea986a75ae4852a9890592d494927cbdd1ace1db55bfb19b548d88b11be"

      def install
        bin.install "edgedb-cli-3.2.0-dev.1003+8444fe3" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.2.0-dev.1003+4a01837",
        using: :nounzip
      sha256 "d0f6366b5b7abc84c2a451c728502a035e9593e8a064d770cd7c87bc16d64099"

      def install
        bin.install "edgedb-cli-3.2.0-dev.1003+4a01837" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
