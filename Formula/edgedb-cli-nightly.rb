class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "4.1.0-dev.1066"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-4.1.0-dev.1066+4d37c7e",
        using: :nounzip
      sha256 "b6cc65e32f201baa7d9216de5eac3abe5fe03b32a59649abbfd0778c33bf06a4"

      def install
        bin.install "edgedb-cli-4.1.0-dev.1066+4d37c7e" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-4.1.0-dev.1066+0d79d1f",
        using: :nounzip
      sha256 "4770c0e2a2f71bfbe70cb80b1e8d82cda5a982fad66f52b69b360599bab52782"

      def install
        bin.install "edgedb-cli-4.1.0-dev.1066+0d79d1f" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-4.1.0-dev.1066+270f420",
        using: :nounzip
      sha256 "b4b76f2d52ddb859ffec1ed73e045fb86321c61f10f528e9c1d61d192923aadf"

      def install
        bin.install "edgedb-cli-4.1.0-dev.1066+270f420" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-4.1.0-dev.1066+c02be5b",
        using: :nounzip
      sha256 "ca0bd17ef95504340da3efa1811077427686915d791ae59673dee143e60d35c9"

      def install
        bin.install "edgedb-cli-4.1.0-dev.1066+c02be5b" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
