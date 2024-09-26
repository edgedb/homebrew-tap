class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "5.3.0-dev.1183"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-5.3.0-dev.1183+84546cc",
        using: :nounzip
      sha256 "5f8d2c2e66e55a084c2e43671781be5f56219e3b4eb9b54843f4cf853f5af148"

      def install
        bin.install "edgedb-cli-5.3.0-dev.1183+84546cc" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-5.3.0-dev.1183+84546cc",
        using: :nounzip
      sha256 "5fd0bbf65b095a41eb9dc97eee40721b5602d34d6c13261c47c59176065e7709"

      def install
        bin.install "edgedb-cli-5.3.0-dev.1183+84546cc" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-5.3.0-dev.1183+77dfc60",
        using: :nounzip
      sha256 "a8f00f15d19381da5be318a96c76025fb07ea7b86befe6374634888e7b6a95b9"

      def install
        bin.install "edgedb-cli-5.3.0-dev.1183+77dfc60" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-5.3.0-dev.1183+84546cc",
        using: :nounzip
      sha256 "d5ddd25481113b791a9b18daa39a661d32b84e9a818e6e26cf9a930d79be81df"

      def install
        bin.install "edgedb-cli-5.3.0-dev.1183+84546cc" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
