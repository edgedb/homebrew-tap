class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "4.3.0-dev.1138"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-4.3.0-dev.1138+af2b269",
        using: :nounzip
      sha256 "7979b8f494d16086280d90cac0f12e04add962edb669c358fc1f130f595e5c13"

      def install
        bin.install "edgedb-cli-4.3.0-dev.1138+af2b269" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-4.3.0-dev.1138+824991b",
        using: :nounzip
      sha256 "059e321b2bca4c613b316c8eb580514162e6c1fb68ccebf726364b19cd51f664"

      def install
        bin.install "edgedb-cli-4.3.0-dev.1138+824991b" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-4.3.0-dev.1138+e8542d5",
        using: :nounzip
      sha256 "b071f1ba1a8dc3a5d466ca705728011ac9930cefdb284d54696b9124cb43b7fd"

      def install
        bin.install "edgedb-cli-4.3.0-dev.1138+e8542d5" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-4.3.0-dev.1138+824991b",
        using: :nounzip
      sha256 "febfd97a2a0adc5844000d75195a41e0c1c85a5dd26369f715cef64eb658d172"

      def install
        bin.install "edgedb-cli-4.3.0-dev.1138+824991b" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
