class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "4.3.0-dev.1143"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-4.3.0-dev.1143+13dc4d6",
        using: :nounzip
      sha256 "605b98739894cd54587dc6b0f4f5a3e3b8eeb526cacb330f150f3df436e41646"

      def install
        bin.install "edgedb-cli-4.3.0-dev.1143+13dc4d6" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-4.3.0-dev.1143+13dc4d6",
        using: :nounzip
      sha256 "3860ba1440061831c6cc16488d8d18c8ddbba743cf33a1cbc901be2f85acac9a"

      def install
        bin.install "edgedb-cli-4.3.0-dev.1143+13dc4d6" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-4.3.0-dev.1143+da9f7fa",
        using: :nounzip
      sha256 "10f13bbdc4513c6195ad5cfffbf8e23e6fde2b426860337dd9ea8efc9d3ff1fc"

      def install
        bin.install "edgedb-cli-4.3.0-dev.1143+da9f7fa" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-4.3.0-dev.1143+febf585",
        using: :nounzip
      sha256 "4120375990b80ebfa056a5c2ec24ea88f81a6bb970cd0e582687ff26622d0ffb"

      def install
        bin.install "edgedb-cli-4.3.0-dev.1143+febf585" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
