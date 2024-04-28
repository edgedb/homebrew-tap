class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "5.1.0-dev.1150"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-5.1.0-dev.1150+d5ab695",
        using: :nounzip
      sha256 "8cfc1eb13e64556b580925bbf0819e47b5f31cc134199261550eb290587f452e"

      def install
        bin.install "edgedb-cli-5.1.0-dev.1150+d5ab695" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-5.1.0-dev.1150+d5ab695",
        using: :nounzip
      sha256 "923392732d4242394b5dc561b1d88a0d803b8f8b3f82f98e62792b67efa81225"

      def install
        bin.install "edgedb-cli-5.1.0-dev.1150+d5ab695" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-5.1.0-dev.1150+0212f33",
        using: :nounzip
      sha256 "01db82edc8da2b8f41236fde788e109688727266919327d737bac90a72f92722"

      def install
        bin.install "edgedb-cli-5.1.0-dev.1150+0212f33" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-5.1.0-dev.1150+d5ab695",
        using: :nounzip
      sha256 "74d3c7cc2d89cb6b0891fb520aecbfd5ec5f7b4ae5154c8d751a5e5a3d588234"

      def install
        bin.install "edgedb-cli-5.1.0-dev.1150+d5ab695" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
