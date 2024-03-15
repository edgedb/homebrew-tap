class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "4.3.0-dev.1112"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-4.3.0-dev.1112+20f80f4",
        using: :nounzip
      sha256 "f78f9bfd07c96fc27ce4bca6dd58ca8d2615e7177c51a590370bf7d3146e4969"

      def install
        bin.install "edgedb-cli-4.3.0-dev.1112+20f80f4" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-4.3.0-dev.1112+20f80f4",
        using: :nounzip
      sha256 "be2483266b825198dc470dda68c4e8c3ae3609f640914a2c4259492436c2ca19"

      def install
        bin.install "edgedb-cli-4.3.0-dev.1112+20f80f4" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-4.3.0-dev.1112+9706feb",
        using: :nounzip
      sha256 "d44491a1fde3783bee10b38c907a9fdd0ef08ed9a288d7fc1640a55e345d0ad7"

      def install
        bin.install "edgedb-cli-4.3.0-dev.1112+9706feb" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-4.3.0-dev.1112+a6988f8",
        using: :nounzip
      sha256 "56372603a4a1a7bde6daa5d3bf7db068841e6c455627bd79260c9c34a0a50582"

      def install
        bin.install "edgedb-cli-4.3.0-dev.1112+a6988f8" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
