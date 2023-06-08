class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.2.0-dev.1006"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.2.0-dev.1006+636648d",
        using: :nounzip
      sha256 "5f726d4f291f9fbb67f49eb0759f3353fd4411ca82c79e486f9fa91254f159b3"

      def install
        bin.install "edgedb-cli-3.2.0-dev.1006+636648d" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.2.0-dev.1006+0699300",
        using: :nounzip
      sha256 "ec5a5f9bf1a4cd1a96a8d8425b34b2e8347be11227ee96d64f0697167affa1d1"

      def install
        bin.install "edgedb-cli-3.2.0-dev.1006+0699300" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.2.0-dev.1006+118a0d1",
        using: :nounzip
      sha256 "4086d674094904027c6079477c4d61fcfaceba17158fb0e844316e5e4912d527"

      def install
        bin.install "edgedb-cli-3.2.0-dev.1006+118a0d1" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.2.0-dev.1006+5800b05",
        using: :nounzip
      sha256 "2301157987663e63ada97bc35bd6e3e8dd40d50a9c114d41c94037b70c36afdf"

      def install
        bin.install "edgedb-cli-3.2.0-dev.1006+5800b05" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
