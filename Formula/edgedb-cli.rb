class EdgedbCli < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.1.0"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin/edgedb-cli-3.1.0+ab14057",
        using: :nounzip
      sha256 "19c34dff937b80d6dece45f3b5456dc37d6be017a987bcb144fc713bbf3e63d0"

      def install
        bin.install "edgedb-cli-3.1.0+ab14057" => "edgedb"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin/edgedb-cli-3.1.0+5ab6190",
        using: :nounzip
      sha256 "e0b34d9658aa1a96aac07e1aa549d00f5596e121ffdd4dd0e7a77860d8546732"

      def install
        bin.install "edgedb-cli-3.1.0+5ab6190" => "edgedb"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl/edgedb-cli-3.1.0+adfa65f",
        using: :nounzip
      sha256 "09a8ade2cb6eb5bed03e62f0618488b2fdf42818dae401b10cddf89e4cdde566"

      def install
        bin.install "edgedb-cli-3.1.0+adfa65f" => "edgedb"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl/edgedb-cli-3.1.0+69bd230",
        using: :nounzip
      sha256 "838b8d256fb3f0fe616790450919c01a6134993e6c8b2a4c1326f70d6531aa5c"

      def install
        bin.install "edgedb-cli-3.1.0+69bd230" => "edgedb"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb", "--version"
  end
end
