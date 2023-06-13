class EdgedbCli < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.1.3"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin/edgedb-cli-3.1.3+2f81fc4",
        using: :nounzip
      sha256 "a226224a3fdca25be9bae5b11c2a85b2058ecfaf274354fdfded23d7b6069fed"

      def install
        bin.install "edgedb-cli-3.1.3+2f81fc4" => "edgedb"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin/edgedb-cli-3.1.3+9fdca62",
        using: :nounzip
      sha256 "bab578fc17d85a9b8355acc4dfd9ff05fa0f70a8cdb04964bd29072ae024ef03"

      def install
        bin.install "edgedb-cli-3.1.3+9fdca62" => "edgedb"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl/edgedb-cli-3.1.3+33964a6",
        using: :nounzip
      sha256 "5b72d5fee1bdc831e8793c9106b148376a7a2b171fe47537c84555907acb7a34"

      def install
        bin.install "edgedb-cli-3.1.3+33964a6" => "edgedb"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl/edgedb-cli-3.1.3+9e580f2",
        using: :nounzip
      sha256 "8a995b06d2e4c09a9572349b6b3e142c0f4232df3f2bbb0642b6dc82dcdf9446"

      def install
        bin.install "edgedb-cli-3.1.3+9e580f2" => "edgedb"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb", "--version"
  end
end
