class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "5.2.0-dev.1172"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-5.2.0-dev.1172+e3af84b",
        using: :nounzip
      sha256 "218703d72e8bcea6f4571da3e69078a2c2d882be7e7873b95ad3c91a5421a3f9"

      def install
        bin.install "edgedb-cli-5.2.0-dev.1172+e3af84b" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-5.2.0-dev.1172+e3af84b",
        using: :nounzip
      sha256 "34533c395db144ba62bbc79201bb5b06f1e5b9ee6b949db58e8fc89cf0287764"

      def install
        bin.install "edgedb-cli-5.2.0-dev.1172+e3af84b" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-5.2.0-dev.1172+9fdf6f8",
        using: :nounzip
      sha256 "5a9cab796423f3fe00c16e65f80cc9b30bed29e5ececfe652ebda554b78fe5e6"

      def install
        bin.install "edgedb-cli-5.2.0-dev.1172+9fdf6f8" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-5.2.0-dev.1172+684c26a",
        using: :nounzip
      sha256 "95e5c8d31d8476cf03191409dd28a67685f88dfafd117dd099f3c8f8ed5fd79d"

      def install
        bin.install "edgedb-cli-5.2.0-dev.1172+684c26a" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
