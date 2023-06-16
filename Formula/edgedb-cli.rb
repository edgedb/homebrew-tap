class EdgedbCli < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.2.0"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin/edgedb-cli-3.2.0+165ce00",
        using: :nounzip
      sha256 "245062eae1951bc3e9661c272c6609590a21ad83713ba0586f278993f0985cf3"

      def install
        bin.install "edgedb-cli-3.2.0+165ce00" => "edgedb"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin/edgedb-cli-3.2.0+165ce00",
        using: :nounzip
      sha256 "6f06ff76483f0a37324cb59702ca968fbb67d20a4b8438fafd5fe5cf1b9ce147"

      def install
        bin.install "edgedb-cli-3.2.0+165ce00" => "edgedb"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl/edgedb-cli-3.2.0+3c8f2a6",
        using: :nounzip
      sha256 "256884bc5b42e5d4055b31b928727adbf523f174ad46d2d141e92dedd0096f1c"

      def install
        bin.install "edgedb-cli-3.2.0+3c8f2a6" => "edgedb"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl/edgedb-cli-3.2.0+b368a4e",
        using: :nounzip
      sha256 "abba5ec00a5531e21c6e9ca71f5807969b7cc044540f09a83c130aa9b4c66df6"

      def install
        bin.install "edgedb-cli-3.2.0+b368a4e" => "edgedb"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb", "--version"
  end
end
