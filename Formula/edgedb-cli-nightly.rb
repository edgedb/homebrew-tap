class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "6.2.0-dev.1267"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-6.2.0-dev.1267+dc55b47",
        using: :nounzip
      sha256 "00c34fb7a74bbbd67639a3b9ea0d75542c9a07c5401e9d9612705238627a8276"

      def install
        bin.install "edgedb-cli-6.2.0-dev.1267+dc55b47" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-6.2.0-dev.1267+7f2c2ef",
        using: :nounzip
      sha256 "941e42bd97bcc50ef16f39f102bfa8cd080b47df7948cd6344fa0889b043b3ba"

      def install
        bin.install "edgedb-cli-6.2.0-dev.1267+7f2c2ef" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-6.2.0-dev.1267+9b1282e",
        using: :nounzip
      sha256 "faa7e139b1af9ee015b9b5251f2b29b9531cf63b8fe7c327bdf65ae304c32bc5"

      def install
        bin.install "edgedb-cli-6.2.0-dev.1267+9b1282e" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-6.2.0-dev.1267+609b673",
        using: :nounzip
      sha256 "978048980e8af4563de79107ba8753b4b9e8354d3a63588efb5fda5348d75f7a"

      def install
        bin.install "edgedb-cli-6.2.0-dev.1267+609b673" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
