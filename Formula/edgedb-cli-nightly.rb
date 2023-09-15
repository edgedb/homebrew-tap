class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "4.0.0-dev.1034"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-4.0.0-dev.1034+8c59973",
        using: :nounzip
      sha256 "90174b311f04c2f0d9cdcfc85ae3b51ab5387e07aec3cd53757c62975b050d7e"

      def install
        bin.install "edgedb-cli-4.0.0-dev.1034+8c59973" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-4.0.0-dev.1034+e141385",
        using: :nounzip
      sha256 "c8645551d9241204dac12aa7af42adf3ba63bbc53b751e42749249d822d4a6f9"

      def install
        bin.install "edgedb-cli-4.0.0-dev.1034+e141385" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-4.0.0-dev.1034+2b9ab2f",
        using: :nounzip
      sha256 "f8e04b305b810d81190405ebc6ad3f37cc4cfed68f1a60581a63cc1fd836835e"

      def install
        bin.install "edgedb-cli-4.0.0-dev.1034+2b9ab2f" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-4.0.0-dev.1034+9349f1c",
        using: :nounzip
      sha256 "928e798330972c1cda3417cb8099a6cd0f26f35f6927bc3275cc2592b2aaf496"

      def install
        bin.install "edgedb-cli-4.0.0-dev.1034+9349f1c" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
