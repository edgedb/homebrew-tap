class EdgedbCliTesting < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.0.0-beta.1"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.testing/edgedb-cli-3.0.0-beta.1+3df4cf7",
        using: :nounzip
      sha256 "a7a59f1200512b69d8bf0a787090207d506de604574375ef4b889137b7b8b989"

      def install
        bin.install "edgedb-cli-3.0.0-beta.1+3df4cf7" => "edgedb-testing"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.testing/edgedb-cli-3.0.0-beta.1+112d27f",
        using: :nounzip
      sha256 "e1672f40434aa003719765c23f8c4f3bc56b068bb259276ec9e5d835025034e7"

      def install
        bin.install "edgedb-cli-3.0.0-beta.1+112d27f" => "edgedb-testing"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.testing/edgedb-cli-3.0.0-beta.1+0706c37",
        using: :nounzip
      sha256 "bdfac805e3093f16c570c71268b7e8e8d559755e825acd212064f847c0056a07"

      def install
        bin.install "edgedb-cli-3.0.0-beta.1+0706c37" => "edgedb-testing"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.testing/edgedb-cli-3.0.0-beta.1+a4e4d33",
        using: :nounzip
      sha256 "85bd32d4b37da185d44ca342b680f16a0849d2da583bd77b0e8800e38c5395a6"

      def install
        bin.install "edgedb-cli-3.0.0-beta.1+a4e4d33" => "edgedb-testing"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-testing", "--version"
  end
end
