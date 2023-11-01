class EdgedbCli < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "4.0.0"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin/edgedb-cli-4.0.0+4667e5b",
        using: :nounzip
      sha256 "8f6dd5f28a9e208ea5ad8e35d7eab22b8daf0df85e98283c24d7a44486cbf738"

      def install
        bin.install "edgedb-cli-4.0.0+4667e5b" => "edgedb"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin/edgedb-cli-4.0.0+4667e5b",
        using: :nounzip
      sha256 "75abb9f78cb0e478660808aa8d17c4271d70f6de33cde59ee792200ba9d815a3"

      def install
        bin.install "edgedb-cli-4.0.0+4667e5b" => "edgedb"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl/edgedb-cli-4.0.0+212057a",
        using: :nounzip
      sha256 "0e769dafb7cda8072f42cb059519a605ac2f50aeba7e91784a1f231c5467b88d"

      def install
        bin.install "edgedb-cli-4.0.0+212057a" => "edgedb"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl/edgedb-cli-4.0.0+92e6888",
        using: :nounzip
      sha256 "c462d311693bc0f6de5e3bf1f56b6a72fed71d74481c2e192e830f7dd6558510"

      def install
        bin.install "edgedb-cli-4.0.0+92e6888" => "edgedb"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb", "--version"
  end
end
