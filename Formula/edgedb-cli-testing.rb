class EdgedbCliTesting < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.0.0-beta.2"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.testing/edgedb-cli-3.0.0-beta.2+97ce8b7",
        using: :nounzip
      sha256 "a84e3824e0c5c095842635ddc23d4090ba53a63f0beddd80ee97579530555622"

      def install
        bin.install "edgedb-cli-3.0.0-beta.2+97ce8b7" => "edgedb-testing"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.testing/edgedb-cli-3.0.0-beta.2+6b68d08",
        using: :nounzip
      sha256 "12544008f3c559cc49851708b0a28c26f33a2cfcc49ddfe137ecd6a58c6682ea"

      def install
        bin.install "edgedb-cli-3.0.0-beta.2+6b68d08" => "edgedb-testing"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.testing/edgedb-cli-3.0.0-beta.2+b2321e2",
        using: :nounzip
      sha256 "026a62c3bd6da5118324625b4247046ccbe63c4bfd12a2847726e2b5d30d10ae"

      def install
        bin.install "edgedb-cli-3.0.0-beta.2+b2321e2" => "edgedb-testing"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.testing/edgedb-cli-3.0.0-beta.2+2ce3d4c",
        using: :nounzip
      sha256 "5f44951c97cdfde1f46ecd06b8a902772c470153870b2700a6364336ec64fe16"

      def install
        bin.install "edgedb-cli-3.0.0-beta.2+2ce3d4c" => "edgedb-testing"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-testing", "--version"
  end
end
