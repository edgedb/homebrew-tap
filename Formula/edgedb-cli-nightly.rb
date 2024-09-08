class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "5.3.0-dev.1182"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-5.3.0-dev.1182+98beb11",
        using: :nounzip
      sha256 "8a2c8ec4cde9657371ca8fce7b463db02bb972b456fe37a42de9b48bab1f073f"

      def install
        bin.install "edgedb-cli-5.3.0-dev.1182+98beb11" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-5.3.0-dev.1182+307ca42",
        using: :nounzip
      sha256 "1827b34573052d441c0fd83f6dbb9c589e80536f04c5765aed7b97bd6021c6d4"

      def install
        bin.install "edgedb-cli-5.3.0-dev.1182+307ca42" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-5.3.0-dev.1182+402e316",
        using: :nounzip
      sha256 "28a0c97f42867fbf331df30b4ff9ccc6035b4145bed125b7eb8aa2c390c0d7fb"

      def install
        bin.install "edgedb-cli-5.3.0-dev.1182+402e316" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-5.3.0-dev.1182+ce1c297",
        using: :nounzip
      sha256 "3932100909bfd15f685a4c57d0e0e1996633468a3bd7c2af699f32d9de2af51e"

      def install
        bin.install "edgedb-cli-5.3.0-dev.1182+ce1c297" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
