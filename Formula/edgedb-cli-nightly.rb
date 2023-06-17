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
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.3.0-dev.1018+e20c39c",
        using: :nounzip
      sha256 "d493fbe6612bcca15d38e21a411db0fa44bfee3de99802939d39b39a97d26440"

      def install
        bin.install "edgedb-cli-3.3.0-dev.1018+e20c39c" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.3.0-dev.1018+834ab7a",
        using: :nounzip
      sha256 "827578fc012e8fa81cbf6665533d579877626361342363500bffb729ddd1c73a"

      def install
        bin.install "edgedb-cli-3.3.0-dev.1018+834ab7a" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
