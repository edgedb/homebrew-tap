class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "5.2.0-dev.1162"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-5.2.0-dev.1162+8625d37",
        using: :nounzip
      sha256 "dbd535a516668c3457f3936d03565fb73512367f23bdb14a3536a85755869346"

      def install
        bin.install "edgedb-cli-5.2.0-dev.1162+8625d37" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-5.2.0-dev.1162+8625d37",
        using: :nounzip
      sha256 "1418ac7b26f54614a262ebc39f20f2003d5adc838891f42b4c946a64a855f124"

      def install
        bin.install "edgedb-cli-5.2.0-dev.1162+8625d37" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-5.2.0-dev.1162+6665502",
        using: :nounzip
      sha256 "e00edf6a87e624e3aeca1b9ff3d43345eeb9a968a3fd1cce0fb2ab029dfcb4a1"

      def install
        bin.install "edgedb-cli-5.2.0-dev.1162+6665502" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-5.2.0-dev.1162+8625d37",
        using: :nounzip
      sha256 "4048db53fc58e0f23ce9cefd4a9983c0c40c6b161559c3c1b6c765aab7d459b7"

      def install
        bin.install "edgedb-cli-5.2.0-dev.1162+8625d37" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
