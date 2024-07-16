class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "5.3.0-dev.1174"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-5.3.0-dev.1174+f3e1f2f",
        using: :nounzip
      sha256 "8e746f551043df3b11e55ebd99e1c38db52694d148bd73404513ad15b7b50336"

      def install
        bin.install "edgedb-cli-5.3.0-dev.1174+f3e1f2f" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-5.3.0-dev.1174+f3e1f2f",
        using: :nounzip
      sha256 "738ebd1042f0a34a0586d95f2f384431fb20aaeba1108896a8fdfbd2bc247808"

      def install
        bin.install "edgedb-cli-5.3.0-dev.1174+f3e1f2f" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-5.3.0-dev.1174+61df414",
        using: :nounzip
      sha256 "8bbaabfca614ebc32a39797c45bdc364f7294d8c09a75a88554dc928b1d35ea5"

      def install
        bin.install "edgedb-cli-5.3.0-dev.1174+61df414" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-5.3.0-dev.1174+f3e1f2f",
        using: :nounzip
      sha256 "e674a2931004ee6188f633fe33d5f311a256018dd82b13fa2628e5d16c5998e4"

      def install
        bin.install "edgedb-cli-5.3.0-dev.1174+f3e1f2f" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
