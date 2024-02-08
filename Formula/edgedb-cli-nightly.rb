class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "4.1.0-dev.1078"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-4.1.0-dev.1078+d5a9bba",
        using: :nounzip
      sha256 "a33b1c76bcaff9bd5d0322c0368cfb265649595fb6573ce4fcab8ce2597f5896"

      def install
        bin.install "edgedb-cli-4.1.0-dev.1078+d5a9bba" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-4.1.0-dev.1078+d5a9bba",
        using: :nounzip
      sha256 "84bb32ec38252fe2038cef4f0e9a8ec4de08f409408941aa7f3840875ddefde2"

      def install
        bin.install "edgedb-cli-4.1.0-dev.1078+d5a9bba" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-4.1.0-dev.1078+d9e1536",
        using: :nounzip
      sha256 "994d9e5a4226fbf9e5d4cb3e34a90359baf6a04b0f0b724f9170435bf3411c3c"

      def install
        bin.install "edgedb-cli-4.1.0-dev.1078+d9e1536" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-4.1.0-dev.1078+3ed6170",
        using: :nounzip
      sha256 "c6019a35484c3ed128f1260acd8ae9f4a62114c54724c3b0eabdfa6a2d5705ae"

      def install
        bin.install "edgedb-cli-4.1.0-dev.1078+3ed6170" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
