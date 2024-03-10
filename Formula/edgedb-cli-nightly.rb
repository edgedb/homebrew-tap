class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "4.3.0-dev.1105"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-4.3.0-dev.1105+d465638",
        using: :nounzip
      sha256 "e186a64c1b5afe48d43664abe836d83476710536c3479ac11d8f8db5a204facc"

      def install
        bin.install "edgedb-cli-4.3.0-dev.1105+d465638" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-4.3.0-dev.1105+7cd8bc5",
        using: :nounzip
      sha256 "32531cb43ccf873b0b339378d68ee18d907a7c0931b99bf0795d500ecd467288"

      def install
        bin.install "edgedb-cli-4.3.0-dev.1105+7cd8bc5" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-4.3.0-dev.1105+33a33f1",
        using: :nounzip
      sha256 "02d21f9e8657b4e5cc6202f09efdf894e362d1388e377fc39b72245655ae5f42"

      def install
        bin.install "edgedb-cli-4.3.0-dev.1105+33a33f1" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-4.3.0-dev.1105+ee82fc8",
        using: :nounzip
      sha256 "547c3f633680fc1fe0e7b2c169d03168ebc3b32e001c7ce5be3976ffe342cb92"

      def install
        bin.install "edgedb-cli-4.3.0-dev.1105+ee82fc8" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
