class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.2.0-dev.999"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.2.0-dev.999+b76cd9f",
        using: :nounzip
      sha256 "abe226194ae95b54668103b186fba3e653cdcb3fc88dce54f429750894c8a22c"

      def install
        bin.install "edgedb-cli-3.2.0-dev.999+b76cd9f" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.2.0-dev.999+84d823c",
        using: :nounzip
      sha256 "c21c030c775bd1e5383234dd858076b76f5372362ebf167211bfce53f60cedad"

      def install
        bin.install "edgedb-cli-3.2.0-dev.999+84d823c" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.2.0-dev.999+d25fa9f",
        using: :nounzip
      sha256 "14f4b325032a20e26f8a7e3831ddad0a7637ef32078125a342a378f9f622e9d2"

      def install
        bin.install "edgedb-cli-3.2.0-dev.999+d25fa9f" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.2.0-dev.999+a04cb9d",
        using: :nounzip
      sha256 "b1a67f35885f393e78d20a46e429b1340d2c5206531ee089ec2417dfda716a13"

      def install
        bin.install "edgedb-cli-3.2.0-dev.999+a04cb9d" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
