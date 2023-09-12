class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.5.0-dev.1031"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.5.0-dev.1031+087844e",
        using: :nounzip
      sha256 "0a69c3cc63de0e35ef886b92fac0befc83262125e0d45420958020f36b813001"

      def install
        bin.install "edgedb-cli-3.5.0-dev.1031+087844e" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.5.0-dev.1031+157afba",
        using: :nounzip
      sha256 "8efd19296b78118d18e9e2900fb8a1cb72e58425f1d5c7bac1a93033bee78695"

      def install
        bin.install "edgedb-cli-3.5.0-dev.1031+157afba" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.5.0-dev.1031+388d56f",
        using: :nounzip
      sha256 "8830e979a9f9c2be1f0711ebdffc6e731f2be6c9464f649d2678fe12d77b1027"

      def install
        bin.install "edgedb-cli-3.5.0-dev.1031+388d56f" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.5.0-dev.1031+3abeaee",
        using: :nounzip
      sha256 "68481499cd1d9b8ed86f2e581ad2eb5fadf6eeb8e9dfe3051f0b9e65d8264094"

      def install
        bin.install "edgedb-cli-3.5.0-dev.1031+3abeaee" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
