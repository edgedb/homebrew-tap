class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "4.1.0-dev.1071"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-4.1.0-dev.1071+3f7992f",
        using: :nounzip
      sha256 "f27ed5ba6fe902c46c2527bd8938efa6cfebbc914a3ec656184a97350a8f945e"

      def install
        bin.install "edgedb-cli-4.1.0-dev.1071+3f7992f" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-4.1.0-dev.1071+0462feb",
        using: :nounzip
      sha256 "8cc981ea6df9c72f0927e628bec85c2e1e164999d3e7eb3072f8f0fff4c522cd"

      def install
        bin.install "edgedb-cli-4.1.0-dev.1071+0462feb" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-4.1.0-dev.1071+39da383",
        using: :nounzip
      sha256 "09400c4e5baa0dc9cdb6adf30b7a09c465ca753a3d62729e7201fec029bb0138"

      def install
        bin.install "edgedb-cli-4.1.0-dev.1071+39da383" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-4.1.0-dev.1071+79c0ec4",
        using: :nounzip
      sha256 "e4225454600bb3e6ef8d518ebc7f9e74d4f5c5e9e5ad390f2e8aab4d6c30cfbc"

      def install
        bin.install "edgedb-cli-4.1.0-dev.1071+79c0ec4" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
