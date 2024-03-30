class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "4.3.0-dev.1122"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-4.3.0-dev.1122+ce87526",
        using: :nounzip
      sha256 "6d7360d6b0e25a133fe0912e4e22f52927e90272136c923a5931017c2d9fc64f"

      def install
        bin.install "edgedb-cli-4.3.0-dev.1122+ce87526" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-4.3.0-dev.1122+f5f144c",
        using: :nounzip
      sha256 "4f4d06d433a943c51ae673d518dacb9094beacb9d2c1e5afc615ef1ac8e9cb11"

      def install
        bin.install "edgedb-cli-4.3.0-dev.1122+f5f144c" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-4.3.0-dev.1122+38e69cc",
        using: :nounzip
      sha256 "3db98be52516744d4cb442d5dc7261f2564d96f47fb89869ec0070184effa6f4"

      def install
        bin.install "edgedb-cli-4.3.0-dev.1122+38e69cc" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-4.3.0-dev.1122+51dc38b",
        using: :nounzip
      sha256 "505bd955269d5a32660bc9749092df662c906c995ff2022fde809b6a86124514"

      def install
        bin.install "edgedb-cli-4.3.0-dev.1122+51dc38b" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
