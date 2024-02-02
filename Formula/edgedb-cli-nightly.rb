class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "4.1.0-dev.1074"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-4.1.0-dev.1074+dc677c8",
        using: :nounzip
      sha256 "3714ac7a317d16633976fbcc4faa91a830dfd6cbcc5ce8652b40453097e7984d"

      def install
        bin.install "edgedb-cli-4.1.0-dev.1074+dc677c8" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-4.1.0-dev.1074+f59ef6b",
        using: :nounzip
      sha256 "799c0d7944fa2d0082bffcb43c4dee991e2e4e2ee5e38067478f273ce2df8cb6"

      def install
        bin.install "edgedb-cli-4.1.0-dev.1074+f59ef6b" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-4.1.0-dev.1074+0860176",
        using: :nounzip
      sha256 "e980c3f87a6aa064adb254cdfbb4af328c0a4aa5a0aa72f88ede54328f855bfd"

      def install
        bin.install "edgedb-cli-4.1.0-dev.1074+0860176" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-4.1.0-dev.1074+974f66d",
        using: :nounzip
      sha256 "3b48d3aa8d695c97b58c6f04df7c5b53a3c4a2841a3f41b82d5ea62d5283216b"

      def install
        bin.install "edgedb-cli-4.1.0-dev.1074+974f66d" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
