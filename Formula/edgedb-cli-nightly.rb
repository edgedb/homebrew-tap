class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "6.1.0-dev.1225"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-6.1.0-dev.1225+36f11b4",
        using: :nounzip
      sha256 "572de9856e977bc99e85b5221e5d82d9a15077e4e94fe8da4fd64553eee632cf"

      def install
        bin.install "edgedb-cli-6.1.0-dev.1225+36f11b4" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-6.1.0-dev.1225+36f11b4",
        using: :nounzip
      sha256 "f659062b166a5fef98c394097b8331ca82afadfae6fccbd3e75b3ca2da7ed9ea"

      def install
        bin.install "edgedb-cli-6.1.0-dev.1225+36f11b4" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-6.1.0-dev.1225+3ddec2d",
        using: :nounzip
      sha256 "cf8b555d639aeaaf5ce0812d727065fcb7a91977d24ff28e9273c0d87449dc8e"

      def install
        bin.install "edgedb-cli-6.1.0-dev.1225+3ddec2d" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-6.1.0-dev.1225+de08a07",
        using: :nounzip
      sha256 "233df6da1fb0238508435b28f97135fd0e1784883f1efa7bcfa654aeb4ba4a99"

      def install
        bin.install "edgedb-cli-6.1.0-dev.1225+de08a07" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
