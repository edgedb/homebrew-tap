class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "4.2.1-dev.1092"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-4.2.1-dev.1092+b2a234f",
        using: :nounzip
      sha256 "39a87adef994ec1dc449fc6e778dcad945e4f3c8f64f2bb48614fea112a18eea"

      def install
        bin.install "edgedb-cli-4.2.1-dev.1092+b2a234f" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-4.2.1-dev.1092+2801143",
        using: :nounzip
      sha256 "7fec8a8d196c8f2abb165435c2bcd30323e32f33f0a58490e9f5e99d475aad5c"

      def install
        bin.install "edgedb-cli-4.2.1-dev.1092+2801143" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-4.2.1-dev.1092+04d5e8f",
        using: :nounzip
      sha256 "fd03e45a3b011ec86f01c836fec68ac29e007f97928a8fd04e42bd2fe9d0a806"

      def install
        bin.install "edgedb-cli-4.2.1-dev.1092+04d5e8f" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-4.2.1-dev.1092+cf1af3b",
        using: :nounzip
      sha256 "8b9cf01661293fd11b357d4ef7c420edcaf36254e2a841e266508ff77807f81b"

      def install
        bin.install "edgedb-cli-4.2.1-dev.1092+cf1af3b" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
