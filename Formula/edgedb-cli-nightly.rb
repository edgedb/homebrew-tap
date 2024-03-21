class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "4.3.0-dev.1113"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-4.3.0-dev.1113+16beb02",
        using: :nounzip
      sha256 "8cd0cd6aa15fa64a712adddaf4559bea269fa1e086d1b8c664d2b21ff7d6d937"

      def install
        bin.install "edgedb-cli-4.3.0-dev.1113+16beb02" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-4.3.0-dev.1113+264f52a",
        using: :nounzip
      sha256 "212365c757df3aa7904c9718c9029e61a129cea91953c44efb7506d29ce46705"

      def install
        bin.install "edgedb-cli-4.3.0-dev.1113+264f52a" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-4.3.0-dev.1113+d6055c5",
        using: :nounzip
      sha256 "204559451aa8caaa34383c1908bc442340910dcbd461fce96472bd92e1a7d3a3"

      def install
        bin.install "edgedb-cli-4.3.0-dev.1113+d6055c5" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-4.3.0-dev.1113+3ad39ca",
        using: :nounzip
      sha256 "616285bcf359c92cdce858147240d3f77a92bb7e209c1bc1ebf2229a46d33a08"

      def install
        bin.install "edgedb-cli-4.3.0-dev.1113+3ad39ca" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
