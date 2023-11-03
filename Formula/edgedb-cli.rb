class EdgedbCli < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "4.0.1"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin/edgedb-cli-4.0.1+bf01004",
        using: :nounzip
      sha256 "b5c3a0945d8cba34ea8c94d641bbbcfb5bfa575097dc174a7d46343efbc5dbf7"

      def install
        bin.install "edgedb-cli-4.0.1+bf01004" => "edgedb"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin/edgedb-cli-4.0.1+44b445d",
        using: :nounzip
      sha256 "ed12e6a6e226a8710b67e25b365b77c061dbcec748fcac8628df4237c93151a9"

      def install
        bin.install "edgedb-cli-4.0.1+44b445d" => "edgedb"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl/edgedb-cli-4.0.1+16937ff",
        using: :nounzip
      sha256 "3dd8a2d1ca8edb115e21cb41b53f5edddfa7d3ce7fb9e13441b9b665ee38acda"

      def install
        bin.install "edgedb-cli-4.0.1+16937ff" => "edgedb"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl/edgedb-cli-4.0.1+bf01004",
        using: :nounzip
      sha256 "2b185867adc75b10160fb79874b59d251906ef4163cb8896dc941f322efae471"

      def install
        bin.install "edgedb-cli-4.0.1+bf01004" => "edgedb"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb", "--version"
  end
end
