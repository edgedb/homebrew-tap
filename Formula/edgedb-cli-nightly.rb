class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "5.3.0-dev.1175"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-5.3.0-dev.1175+260f696",
        using: :nounzip
      sha256 "51f77b32db145efbdde5ac9126d83e91a9e76f5cbead901a396119785565e758"

      def install
        bin.install "edgedb-cli-5.3.0-dev.1175+260f696" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-5.3.0-dev.1175+2c00eab",
        using: :nounzip
      sha256 "9bcb075b6bd9aa6d3df11d51c905610e47be96071862824ee42d4db7e902a2b3"

      def install
        bin.install "edgedb-cli-5.3.0-dev.1175+2c00eab" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-5.3.0-dev.1175+2eb0b6c",
        using: :nounzip
      sha256 "a4bbb15153fd6e5a4f430c27801b111498ad7dbc9cc6831bffb526db626f1cbd"

      def install
        bin.install "edgedb-cli-5.3.0-dev.1175+2eb0b6c" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-5.3.0-dev.1175+d68dc5b",
        using: :nounzip
      sha256 "c867128f5bfd0a156ffc24355ab2f5e7aab41ba931416c4db4147c27954ac679"

      def install
        bin.install "edgedb-cli-5.3.0-dev.1175+d68dc5b" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
