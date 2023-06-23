class EdgedbCli < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.3.0"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin/edgedb-cli-3.3.0+3f6a0a0",
        using: :nounzip
      sha256 "4d4c9b0bb284d8ec8d1e0011d5027014458d7a50637ebf9a1ac6d6f90abad0b8"

      def install
        bin.install "edgedb-cli-3.3.0+3f6a0a0" => "edgedb"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin/edgedb-cli-3.3.0+29bb465",
        using: :nounzip
      sha256 "23c021642c0b47f00ce1e497e7be52c7523b94267f8ff25e4dd368fb19f6000d"

      def install
        bin.install "edgedb-cli-3.3.0+29bb465" => "edgedb"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl/edgedb-cli-3.3.0+c903f9f",
        using: :nounzip
      sha256 "2bc6f16fded9015d12b3a1fe3d34d611cf53926729f4531e25d5e1ac6097b529"

      def install
        bin.install "edgedb-cli-3.3.0+c903f9f" => "edgedb"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl/edgedb-cli-3.3.0+071876c",
        using: :nounzip
      sha256 "ceaa247898d74da91dd7347dbc43809baa253fb73043163872ddde7e3b382cce"

      def install
        bin.install "edgedb-cli-3.3.0+071876c" => "edgedb"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb", "--version"
  end
end
