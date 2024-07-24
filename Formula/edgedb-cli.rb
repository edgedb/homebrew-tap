class EdgedbCli < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "5.2.2"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin/edgedb-cli-5.2.2+ed96c17",
        using: :nounzip
      sha256 "6a84cfbfe0c3307e5a0ff82b3c52e0b364300c58fb8b6b0fd47e4b2cc8d1b67e"

      def install
        bin.install "edgedb-cli-5.2.2+ed96c17" => "edgedb"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin/edgedb-cli-5.2.2+ed96c17",
        using: :nounzip
      sha256 "5e12192fbc27a6056dbad56b0ead29c7432a8fc32a0c3864479f08e00dafc0b8"

      def install
        bin.install "edgedb-cli-5.2.2+ed96c17" => "edgedb"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl/edgedb-cli-5.2.2+6e53827",
        using: :nounzip
      sha256 "0cc65f87881f8da65ac80b26a4de6f64d4282e0f0e05f2e8c15eefe639a39c90"

      def install
        bin.install "edgedb-cli-5.2.2+6e53827" => "edgedb"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl/edgedb-cli-5.2.2+1e9d5a9",
        using: :nounzip
      sha256 "230341040b8f3080ec80ef622e870b0b926854c5f27070621ab416f24b094ff9"

      def install
        bin.install "edgedb-cli-5.2.2+1e9d5a9" => "edgedb"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb", "--version"
  end
end
