class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.5.0-dev.1025"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.5.0-dev.1025+dfdfdc1",
        using: :nounzip
      sha256 "57f7675ebfd64155d014bef4f22e2b05993794e3a9ddd7a20735867b80b668c5"

      def install
        bin.install "edgedb-cli-3.5.0-dev.1025+dfdfdc1" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.5.0-dev.1025+1d008f7",
        using: :nounzip
      sha256 "1fa30c5a95b7fda0c5713ac2acd6d5a18649907819f800d4f2f3a767a8a9d044"

      def install
        bin.install "edgedb-cli-3.5.0-dev.1025+1d008f7" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.5.0-dev.1025+6e4a61d",
        using: :nounzip
      sha256 "dd74043773964bc9247059371108e0e33d7e3f6845d7196ba81b1ef8a4be0420"

      def install
        bin.install "edgedb-cli-3.5.0-dev.1025+6e4a61d" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.5.0-dev.1025+21b3681",
        using: :nounzip
      sha256 "bbcef8571ddc079f7a8fbcf10fb08649526e4e154a954ac6ad4cd8abf83be8bf"

      def install
        bin.install "edgedb-cli-3.5.0-dev.1025+21b3681" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
