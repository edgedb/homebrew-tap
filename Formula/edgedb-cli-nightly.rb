class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "6.1.0-dev.1224"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-6.1.0-dev.1224+2c4e1da",
        using: :nounzip
      sha256 "58a22fa9a769972c0e883bf395a29f876846791e9b9eb4b5e2f7fa9901b99c99"

      def install
        bin.install "edgedb-cli-6.1.0-dev.1224+2c4e1da" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-6.1.0-dev.1224+2c4e1da",
        using: :nounzip
      sha256 "de37802bd616fb826d1f207bb1604ca22f09ab6e67e5c92fc42176a1b42e87ad"

      def install
        bin.install "edgedb-cli-6.1.0-dev.1224+2c4e1da" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-6.1.0-dev.1224+e762c12",
        using: :nounzip
      sha256 "d10b79aba954ca2ec306e30fc1b5e24d3df14367a273f0e174b37eb6656211cc"

      def install
        bin.install "edgedb-cli-6.1.0-dev.1224+e762c12" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-6.1.0-dev.1224+2321be2",
        using: :nounzip
      sha256 "5ca37d13623b1fbf84f3a535ccde72048449dd851a3e1aa4f82804368d9155a3"

      def install
        bin.install "edgedb-cli-6.1.0-dev.1224+2321be2" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
