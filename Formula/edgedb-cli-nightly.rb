class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.5.0-dev.1025"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.5.0-dev.1025+363f8a5",
        using: :nounzip
      sha256 "017b3ebcb89ed0429d0aa8deea7346e819075da898637a11772064468124b320"

      def install
        bin.install "edgedb-cli-3.5.0-dev.1025+363f8a5" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.5.0-dev.1025+05cc3da",
        using: :nounzip
      sha256 "0d98aef388d233681525d5d057d9685e74d6bf4d5c23e322c451579d8c84cb17"

      def install
        bin.install "edgedb-cli-3.5.0-dev.1025+05cc3da" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.5.0-dev.1025+18fe820",
        using: :nounzip
      sha256 "3983e95deff300c4a4498574e2cb70cdfa1e5dd8ac76ec86e70cb836a0a39f12"

      def install
        bin.install "edgedb-cli-3.5.0-dev.1025+18fe820" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.5.0-dev.1025+0201e32",
        using: :nounzip
      sha256 "a3310d51e2bc3f8e4cb346fb73a4dcf5b7a789dac2334731d9901899e839737f"

      def install
        bin.install "edgedb-cli-3.5.0-dev.1025+0201e32" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
