class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "4.0.0-dev.1036"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-4.0.0-dev.1036+07d2b62",
        using: :nounzip
      sha256 "85865b5a52badc5fc6063a2f64fba9befaf004d7a901c83500fb5e108b8936c2"

      def install
        bin.install "edgedb-cli-4.0.0-dev.1036+07d2b62" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-4.0.0-dev.1036+29a8b2f",
        using: :nounzip
      sha256 "ddc8fdcca3e6c15bcd28dd2d1443d096a17f65d7e7e24a43ead759c615a73c3c"

      def install
        bin.install "edgedb-cli-4.0.0-dev.1036+29a8b2f" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-4.0.0-dev.1036+b36e864",
        using: :nounzip
      sha256 "f9680e14f403c28c66bd1301e532547d48b10080ef223e7a3c62038fddbe87ce"

      def install
        bin.install "edgedb-cli-4.0.0-dev.1036+b36e864" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-4.0.0-dev.1036+ab067f4",
        using: :nounzip
      sha256 "755b50f33479761b6d3e253e2169bf3a636860db0415359a0ee974f3e51694e5"

      def install
        bin.install "edgedb-cli-4.0.0-dev.1036+ab067f4" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
