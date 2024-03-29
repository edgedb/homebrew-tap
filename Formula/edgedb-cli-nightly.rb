class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "4.3.0-dev.1120"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-4.3.0-dev.1120+d5587b7",
        using: :nounzip
      sha256 "e1e9cbb5e1797e7d32682845077c9f6d3f1ba017251304b492ac7c548fed9d7e"

      def install
        bin.install "edgedb-cli-4.3.0-dev.1120+d5587b7" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-4.3.0-dev.1120+8708595",
        using: :nounzip
      sha256 "6bc92692cf23c6cb640fdb16c2eb049274ff2157ce0b44a9baf9b3f42f56ab8a"

      def install
        bin.install "edgedb-cli-4.3.0-dev.1120+8708595" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-4.3.0-dev.1120+77b2d4b",
        using: :nounzip
      sha256 "c780bd470ec403fd95cde1e51fbaae04d47a2ccbdccf7057b8c0ddd6f645fccb"

      def install
        bin.install "edgedb-cli-4.3.0-dev.1120+77b2d4b" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-4.3.0-dev.1120+8574989",
        using: :nounzip
      sha256 "84267be6fb99523590ed2c70dba3c6768ae588af62270eb575fb5b7a483a4d84"

      def install
        bin.install "edgedb-cli-4.3.0-dev.1120+8574989" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
