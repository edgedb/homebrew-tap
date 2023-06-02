class EdgedbCli < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.1.1"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin/edgedb-cli-3.1.1+5798f31",
        using: :nounzip
      sha256 "2cb19b8ee919e472bca2872622996f4d7c845f69486879b5b04316da5dd6170c"

      def install
        bin.install "edgedb-cli-3.1.1+5798f31" => "edgedb"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin/edgedb-cli-3.1.1+fa5ffee",
        using: :nounzip
      sha256 "ccacb01ca3921c8ae0ad52b845db144042090146d58b1f201969624c05c10389"

      def install
        bin.install "edgedb-cli-3.1.1+fa5ffee" => "edgedb"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl/edgedb-cli-3.1.1+4e8600e",
        using: :nounzip
      sha256 "6d4afa88120515d08df66248c1b5e8e17d59dd896e6fdbe56f9341cb59b550ca"

      def install
        bin.install "edgedb-cli-3.1.1+4e8600e" => "edgedb"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl/edgedb-cli-3.1.1+9fe58d3",
        using: :nounzip
      sha256 "694cb219ce41cb06fe27a4ec131fe902b53068f01c7afb67dfa9cff05feeeafd"

      def install
        bin.install "edgedb-cli-3.1.1+9fe58d3" => "edgedb"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb", "--version"
  end
end
