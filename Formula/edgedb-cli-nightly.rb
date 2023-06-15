class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.2.0-dev.1013"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.2.0-dev.1013+4809d2a",
        using: :nounzip
      sha256 "3d0ffe561cb5f060ec52dade2ec1ef9bcae90dd722e7d1205197e67c4b04fc86"

      def install
        bin.install "edgedb-cli-3.2.0-dev.1013+4809d2a" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.2.0-dev.1013+e177377",
        using: :nounzip
      sha256 "15e7006ddee40da328ae26847a39eebbeaea0f51be28f67029767cd4e27c8497"

      def install
        bin.install "edgedb-cli-3.2.0-dev.1013+e177377" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.2.0-dev.1013+2236af9",
        using: :nounzip
      sha256 "a14a58a2897bba21fcbc76565b2b9dd5068f212fad9159c975c08a129c0ad21b"

      def install
        bin.install "edgedb-cli-3.2.0-dev.1013+2236af9" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.2.0-dev.1013+73a0598",
        using: :nounzip
      sha256 "f85bd8d3da1f8200b55d39d7016c552bc677a382c374a59cc3a2c55316a0144c"

      def install
        bin.install "edgedb-cli-3.2.0-dev.1013+73a0598" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
