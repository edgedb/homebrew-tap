class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "4.0.0-dev.1037"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-4.0.0-dev.1037+4379b11",
        using: :nounzip
      sha256 "f916da0b7b3a31a07bf113fa58bf1fc44d6d4e5df31f5d0263cba9a389356488"

      def install
        bin.install "edgedb-cli-4.0.0-dev.1037+4379b11" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-4.0.0-dev.1037+fc82085",
        using: :nounzip
      sha256 "eee107151491c6c69b98438b8c887ada45a218c7fd5e9b6bd04b0491822b3a3c"

      def install
        bin.install "edgedb-cli-4.0.0-dev.1037+fc82085" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-4.0.0-dev.1037+cc53628",
        using: :nounzip
      sha256 "a0b460986732024de72fbf4c4b018869d126d4c223e69ea6fc83109eb4561b2f"

      def install
        bin.install "edgedb-cli-4.0.0-dev.1037+cc53628" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-4.0.0-dev.1037+f6a8dfe",
        using: :nounzip
      sha256 "de58052e37a495ec5a0b0f7d2cc6e9b74d5fdd5876e7536e597c96cec737a897"

      def install
        bin.install "edgedb-cli-4.0.0-dev.1037+f6a8dfe" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
