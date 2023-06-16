class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.2.0-dev.1015"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.2.0-dev.1015+d9b48a7",
        using: :nounzip
      sha256 "ada3440075e99fe0b79def8d67873651042175cd3ce827d0929d074f1399f48e"

      def install
        bin.install "edgedb-cli-3.2.0-dev.1015+d9b48a7" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.2.0-dev.1015+e04fdac",
        using: :nounzip
      sha256 "f82884f23f599099b64b63a54f3258a55aea67e5f58ecccae014a6b9e2f58923"

      def install
        bin.install "edgedb-cli-3.2.0-dev.1015+e04fdac" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.2.0-dev.1015+f533760",
        using: :nounzip
      sha256 "194a2d5a8daa1cfece4fea5b33b6018a46ba22e89ad72f0f041f2a0a623151e2"

      def install
        bin.install "edgedb-cli-3.2.0-dev.1015+f533760" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.2.0-dev.1015+a56b321",
        using: :nounzip
      sha256 "e0dd2f8bed649458162719a9830bef1aadc1ff64da258721461c7132d8ab267d"

      def install
        bin.install "edgedb-cli-3.2.0-dev.1015+a56b321" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
