class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "4.2.0-dev.1090"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-4.2.0-dev.1090+4eb70c4",
        using: :nounzip
      sha256 "951aa96efe316ec888e16b93aad23ff99d69f1975e60df37916b5e70e8300e92"

      def install
        bin.install "edgedb-cli-4.2.0-dev.1090+4eb70c4" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-4.2.0-dev.1090+7d073cb",
        using: :nounzip
      sha256 "d9f112d36f2da1daa90a9fb8fe739f5097619fd26e7ca6568595b6baf46455bf"

      def install
        bin.install "edgedb-cli-4.2.0-dev.1090+7d073cb" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-4.2.0-dev.1090+96ee332",
        using: :nounzip
      sha256 "bf53b4b81017a4c0e26dda9cce75140c172f78230309a068721e615f216b579c"

      def install
        bin.install "edgedb-cli-4.2.0-dev.1090+96ee332" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-4.2.0-dev.1090+9e0aa7b",
        using: :nounzip
      sha256 "6f4b1430050633de17331656ac4f8163d8a073f19b9e3f18c4fd010addd1cd11"

      def install
        bin.install "edgedb-cli-4.2.0-dev.1090+9e0aa7b" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
