class EdgedbCli < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.1.2"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin/edgedb-cli-3.1.2+42ae3eb",
        using: :nounzip
      sha256 "70bcfe217090b57727190b6036e9d87389abd89ccf400b0b65087d96d62cb0af"

      def install
        bin.install "edgedb-cli-3.1.2+42ae3eb" => "edgedb"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin/edgedb-cli-3.1.2+42ae3eb",
        using: :nounzip
      sha256 "061bb7c7207056c3e168e9ef9994ba3bfe5147703b20898a637d3c37b6796d25"

      def install
        bin.install "edgedb-cli-3.1.2+42ae3eb" => "edgedb"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl/edgedb-cli-3.1.2+e73a35e",
        using: :nounzip
      sha256 "fe850c47f2b6b878a5e150b24ef44449141d82faaffc901eecdd334897e31496"

      def install
        bin.install "edgedb-cli-3.1.2+e73a35e" => "edgedb"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl/edgedb-cli-3.1.2+d938bbc",
        using: :nounzip
      sha256 "a106a3e569167abf47ba166f6dd6fb5411706c3574b355aabe55e849fe07ad90"

      def install
        bin.install "edgedb-cli-3.1.2+d938bbc" => "edgedb"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb", "--version"
  end
end
