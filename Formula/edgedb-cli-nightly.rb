class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.4.0-dev.1021"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.4.0-dev.1021+463d2ab",
        using: :nounzip
      sha256 "5e72e35bb6515e441532303f3fd315338b1544eea49b0abaf68e3375a4962bb8"

      def install
        bin.install "edgedb-cli-3.4.0-dev.1021+463d2ab" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.4.0-dev.1021+0f9d967",
        using: :nounzip
      sha256 "ce93570cad524f0e89d5a26726dbc5a095a061f1c54bf4608effd7939b74f1ec"

      def install
        bin.install "edgedb-cli-3.4.0-dev.1021+0f9d967" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.4.0-dev.1021+09ebec6",
        using: :nounzip
      sha256 "9aff8109b92cad17b7b1f79801f7397f13e2e157de957c46a5c7c7a2124fb786"

      def install
        bin.install "edgedb-cli-3.4.0-dev.1021+09ebec6" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.4.0-dev.1021+04b71c7",
        using: :nounzip
      sha256 "970f837c79880b3326fd23bd788a7e51ecde051c430ccb6fc9473d2a4ae5ebc6"

      def install
        bin.install "edgedb-cli-3.4.0-dev.1021+04b71c7" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
