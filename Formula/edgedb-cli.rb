class EdgedbCli < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "6.1.0"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin/edgedb-cli-6.1.0+794de43",
        using: :nounzip
      sha256 "da075e304a1d7aaf88ea788fbe4b43553a9477197411d3ef97f9b149acf66494"

      def install
        bin.install "edgedb-cli-6.1.0+794de43" => "edgedb"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin/edgedb-cli-6.1.0+1f9ea5f",
        using: :nounzip
      sha256 "449d000584857a583bb8b143b05e455b0be7618e7e68fc6a2b8844ad0276ebac"

      def install
        bin.install "edgedb-cli-6.1.0+1f9ea5f" => "edgedb"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl/edgedb-cli-6.1.0+4fd82f4",
        using: :nounzip
      sha256 "c34ebd3db9f177538a8f4aa99ff0b3fcebb9c281a74b7c03bab02e3f019009d6"

      def install
        bin.install "edgedb-cli-6.1.0+4fd82f4" => "edgedb"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl/edgedb-cli-6.1.0+f12dad3",
        using: :nounzip
      sha256 "8d5769e8a3c679eee560e307e09b4984b5197835c3c5e6fa6f75314441d7f0b3"

      def install
        bin.install "edgedb-cli-6.1.0+f12dad3" => "edgedb"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb", "--version"
  end
end
