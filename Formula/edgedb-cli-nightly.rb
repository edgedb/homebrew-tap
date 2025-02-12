class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "6.2.0-dev.1258"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-6.2.0-dev.1258+9f08dd8",
        using: :nounzip
      sha256 "d150d50906b283644f32ae7396fd6256a540edbfaa432466867a5174d6774888"

      def install
        bin.install "edgedb-cli-6.2.0-dev.1258+9f08dd8" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-6.2.0-dev.1258+9f08dd8",
        using: :nounzip
      sha256 "679d88cb2ef02551e9589ac4617cb0d504fadb2af42eb910a9805bb68a5bf892"

      def install
        bin.install "edgedb-cli-6.2.0-dev.1258+9f08dd8" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-6.2.0-dev.1258+08675bd",
        using: :nounzip
      sha256 "6bf24e2fec2026a5188ba19270e9380c93fba2e243e84343090ad2e9bb4c26ef"

      def install
        bin.install "edgedb-cli-6.2.0-dev.1258+08675bd" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-6.2.0-dev.1258+366f25f",
        using: :nounzip
      sha256 "e35ef21f5c7c3f5f0aaf70999d944049349856468da228cf319aaafeb6d6a2d9"

      def install
        bin.install "edgedb-cli-6.2.0-dev.1258+366f25f" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
