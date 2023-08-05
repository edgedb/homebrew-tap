class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.5.0-dev.1026"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.5.0-dev.1026+825c978",
        using: :nounzip
      sha256 "8b9e5daa75f926818042bb04271494f69a60e1e36e58c4cc15a4991b91037258"

      def install
        bin.install "edgedb-cli-3.5.0-dev.1026+825c978" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.5.0-dev.1026+1545d8f",
        using: :nounzip
      sha256 "f5ab0fbe9c124399292a23cbe4ba54fdb235dfce8d29bee45f66dbbbd18b5b86"

      def install
        bin.install "edgedb-cli-3.5.0-dev.1026+1545d8f" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.5.0-dev.1026+a8be23a",
        using: :nounzip
      sha256 "1a3041adcd7a743332c16995f708506f4276d64b953ff35eeb8a0f9fc051ac55"

      def install
        bin.install "edgedb-cli-3.5.0-dev.1026+a8be23a" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.5.0-dev.1026+206878e",
        using: :nounzip
      sha256 "bcd091a9a57293f7324e25a3adaf6bee693e687afc1dec9e234ba96be3dd9b3b"

      def install
        bin.install "edgedb-cli-3.5.0-dev.1026+206878e" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
