class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.2.0-dev.1004"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.2.0-dev.1004+8fb180e",
        using: :nounzip
      sha256 "bd41a8b538b20b1d166d85a54a26c22891d02bc208c80d1ea726abe860a44306"

      def install
        bin.install "edgedb-cli-3.2.0-dev.1004+8fb180e" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.2.0-dev.1004+36963e6",
        using: :nounzip
      sha256 "30e3abcc36fb66580841aec348244df2a65ea3c30665c8e3f3138a0cf1505c0e"

      def install
        bin.install "edgedb-cli-3.2.0-dev.1004+36963e6" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.2.0-dev.1004+79dcda9",
        using: :nounzip
      sha256 "0c5006a543f1c5f2f776d9eb9a84a39122a74ec6ee5bd37d5dea7483eb48e638"

      def install
        bin.install "edgedb-cli-3.2.0-dev.1004+79dcda9" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.2.0-dev.1004+f8d1769",
        using: :nounzip
      sha256 "befb462be684ff9dbb961eb02638e6d9503ec081cebf9ab30311011979c906f7"

      def install
        bin.install "edgedb-cli-3.2.0-dev.1004+f8d1769" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
