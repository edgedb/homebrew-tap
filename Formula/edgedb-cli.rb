class EdgedbCli < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "5.3.0"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin/edgedb-cli-5.3.0+637320a",
        using: :nounzip
      sha256 "1ba101c30386dc579d1dec8a8733e0c8dfcadb6ce236ff0151e78b6cf6259880"

      def install
        bin.install "edgedb-cli-5.3.0+637320a" => "edgedb"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin/edgedb-cli-5.3.0+637320a",
        using: :nounzip
      sha256 "7fbdb5987244785b49cb944ac084c6cdf6e1e5d20b4cce10996a18e9dec802d5"

      def install
        bin.install "edgedb-cli-5.3.0+637320a" => "edgedb"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl/edgedb-cli-5.3.0+b202cc8",
        using: :nounzip
      sha256 "be5f3bb6f16f90fe838fd4d1c54056782e626a38a6ad23c7afaf3f92754b2a96"

      def install
        bin.install "edgedb-cli-5.3.0+b202cc8" => "edgedb"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl/edgedb-cli-5.3.0+637320a",
        using: :nounzip
      sha256 "06548595c98eabd03818f8ae6eb84447de75fee9768bd6f9ee870fb1cf01694c"

      def install
        bin.install "edgedb-cli-5.3.0+637320a" => "edgedb"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb", "--version"
  end
end
