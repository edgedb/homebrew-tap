class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "5.2.0-dev.1161"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-5.2.0-dev.1161+9d76f5a",
        using: :nounzip
      sha256 "cdc7a2c32d0847d5f0d60034185a65b54978e4cbf7220dea2ffc6de69dd6447f"

      def install
        bin.install "edgedb-cli-5.2.0-dev.1161+9d76f5a" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-5.2.0-dev.1161+9d76f5a",
        using: :nounzip
      sha256 "9335dcad8e5662c2b699fc6294f86f0faa9b2f4b22b9dd60fcb6de89c725afac"

      def install
        bin.install "edgedb-cli-5.2.0-dev.1161+9d76f5a" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-5.2.0-dev.1161+0c990eb",
        using: :nounzip
      sha256 "2586346eaf098527b3cce567426268289b58d475ccd7c7947758bdefd358930a"

      def install
        bin.install "edgedb-cli-5.2.0-dev.1161+0c990eb" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-5.2.0-dev.1161+9d76f5a",
        using: :nounzip
      sha256 "270352ea7443902c9a450f5b6e38b6575f86b6247442894b463808fe2b5ca503"

      def install
        bin.install "edgedb-cli-5.2.0-dev.1161+9d76f5a" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
