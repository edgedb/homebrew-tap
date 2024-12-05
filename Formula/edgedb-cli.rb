class EdgedbCli < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "6.0.2"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin/edgedb-cli-6.0.2+5ba8c2c",
        using: :nounzip
      sha256 "387c5c7abb8f32b7f257a46967c611f216af3d9dd732bbab11cc8dee00677976"

      def install
        bin.install "edgedb-cli-6.0.2+5ba8c2c" => "edgedb"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin/edgedb-cli-6.0.2+5ba8c2c",
        using: :nounzip
      sha256 "14a4f3789100c7f880d0b429f97dde023a6a72e73430e83f7537f8294d0163a6"

      def install
        bin.install "edgedb-cli-6.0.2+5ba8c2c" => "edgedb"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl/edgedb-cli-6.0.2+72904b4",
        using: :nounzip
      sha256 "970cc3f7b55f1129eadd25c8445ac967d01918ca234c898a227882cea6ccaeae"

      def install
        bin.install "edgedb-cli-6.0.2+72904b4" => "edgedb"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl/edgedb-cli-6.0.2+d294eb3",
        using: :nounzip
      sha256 "f1c79f4d4a18137fd6b62b5dc18a2c5eda21fee0e07be55a62e0ffd2d0df5e90"

      def install
        bin.install "edgedb-cli-6.0.2+d294eb3" => "edgedb"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb", "--version"
  end
end
