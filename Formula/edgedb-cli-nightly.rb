class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.5.0-dev.1028"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.5.0-dev.1028+3c9c083",
        using: :nounzip
      sha256 "7c9333d750020a47610594a8d285cad6cce7a486b100d8c4059e50c50e23850f"

      def install
        bin.install "edgedb-cli-3.5.0-dev.1028+3c9c083" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.5.0-dev.1028+03eaea4",
        using: :nounzip
      sha256 "cd7c11f27660fba77f8e83f6ac860c7b13f965a58752f96225d6fc1b76dde428"

      def install
        bin.install "edgedb-cli-3.5.0-dev.1028+03eaea4" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.5.0-dev.1028+e697e2a",
        using: :nounzip
      sha256 "5d4ec0c841de44098c3f662ce495e42353b9e4e3e68a1c45c247603bba82c6ca"

      def install
        bin.install "edgedb-cli-3.5.0-dev.1028+e697e2a" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.5.0-dev.1028+421d78b",
        using: :nounzip
      sha256 "20ece9c3bed3521e061018c06e974f8459838c9681c46634b3fb0926726f9947"

      def install
        bin.install "edgedb-cli-3.5.0-dev.1028+421d78b" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
