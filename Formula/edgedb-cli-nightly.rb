class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "4.1.0-dev.1072"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-4.1.0-dev.1072+2a420b7",
        using: :nounzip
      sha256 "9aea5648d74f5ae1f0777642a02bb5b461e5f017a4f496e9cb32d4ccc71b0273"

      def install
        bin.install "edgedb-cli-4.1.0-dev.1072+2a420b7" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-4.1.0-dev.1072+250c8b6",
        using: :nounzip
      sha256 "48a744e87aefb54cbc82616c1a5c2d1108e2c40a8ddd37b5ff54c471a4835e47"

      def install
        bin.install "edgedb-cli-4.1.0-dev.1072+250c8b6" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-4.1.0-dev.1072+6a47248",
        using: :nounzip
      sha256 "6c64fc18f752b3cbfe96c396c49a6f11b30486cadab92533d52252b5eb9b4cd7"

      def install
        bin.install "edgedb-cli-4.1.0-dev.1072+6a47248" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-4.1.0-dev.1072+250c8b6",
        using: :nounzip
      sha256 "7b68ff8ca74f3195ddda937f9bfda0dfd805a45e8e67736eb807724cef7e079b"

      def install
        bin.install "edgedb-cli-4.1.0-dev.1072+250c8b6" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
