class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.3.0-dev.1018"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.3.0-dev.1018+68cfc14",
        using: :nounzip
      sha256 "e8d0f240376a0d2f20b31ce0cbdbe0ef00e28e63f176a95488e5bec24adcd23c"

      def install
        bin.install "edgedb-cli-3.3.0-dev.1018+68cfc14" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.3.0-dev.1018+add3738",
        using: :nounzip
      sha256 "07428761b9345f6e34e81e3129793f0a26c648c21e680c43f87d122b8c926c87"

      def install
        bin.install "edgedb-cli-3.3.0-dev.1018+add3738" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.3.0-dev.1018+9051ac7",
        using: :nounzip
      sha256 "ec9bbe4cecc1c354491af125cb00be41c0e4cdd7c2390f1966b6492da091bbd5"

      def install
        bin.install "edgedb-cli-3.3.0-dev.1018+9051ac7" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.3.0-dev.1018+61ab591",
        using: :nounzip
      sha256 "c0c27e15ae2b63204da72c83cbbbc81400a7aba046579219249ffb13385a3260"

      def install
        bin.install "edgedb-cli-3.3.0-dev.1018+61ab591" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
