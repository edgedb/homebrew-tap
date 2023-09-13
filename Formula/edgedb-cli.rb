class EdgedbCli < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.5.0"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin/edgedb-cli-3.5.0+e1ad387",
        using: :nounzip
      sha256 "cf3e658e8618c3579908d6cc8496034ec00fcda5cce9be5de63ccc5c2ad471c0"

      def install
        bin.install "edgedb-cli-3.5.0+e1ad387" => "edgedb"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin/edgedb-cli-3.5.0+d39be05",
        using: :nounzip
      sha256 "4ad265a6bf329cee0bd3e061eb74a4876622b018ea75d85df9a483577a6df0e4"

      def install
        bin.install "edgedb-cli-3.5.0+d39be05" => "edgedb"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl/edgedb-cli-3.5.0+d43ac2b",
        using: :nounzip
      sha256 "86586949ba1870728a54971b03e967546bad3386320bebc6f72efd59c7596970"

      def install
        bin.install "edgedb-cli-3.5.0+d43ac2b" => "edgedb"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl/edgedb-cli-3.5.0+907ff37",
        using: :nounzip
      sha256 "06503758a1dd02d8ee408435db2a677516b2eb07200ab1965d143812d3cc9aad"

      def install
        bin.install "edgedb-cli-3.5.0+907ff37" => "edgedb"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb", "--version"
  end
end
