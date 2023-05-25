class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.1.0-dev.995"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.1.0-dev.995+fe4e469",
        using: :nounzip
      sha256 "b0d60ebad0209c68a9aa9772613af8c862b8d1e97cf2ab5ca8c27bc08029792b"

      def install
        bin.install "edgedb-cli-3.1.0-dev.995+fe4e469" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.1.0-dev.995+ac238f0",
        using: :nounzip
      sha256 "f09d81f2022d16ccf546ac846a470b198237c4f1fb3d5448fd2ba1a9e450d9cd"

      def install
        bin.install "edgedb-cli-3.1.0-dev.995+ac238f0" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.1.0-dev.995+c1bda28",
        using: :nounzip
      sha256 "af1596d492eb9ca79d84a1ea77047c051ad54d6fb8f69d573254a90ed14b5433"

      def install
        bin.install "edgedb-cli-3.1.0-dev.995+c1bda28" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.1.0-dev.995+7b5545f",
        using: :nounzip
      sha256 "ec442dc8b385b8d8531ce06e9f432e94c9e67b1e77f41bf569e046e860bb78e1"

      def install
        bin.install "edgedb-cli-3.1.0-dev.995+7b5545f" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
