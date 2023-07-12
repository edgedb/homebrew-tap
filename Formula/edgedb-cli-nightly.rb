class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.5.0-dev.1024"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.5.0-dev.1024+05ca024",
        using: :nounzip
      sha256 "fb8265a7013ca3339751d9e84c4cc2c54dd2d30e04d50117d76bea8fa2ab4fc3"

      def install
        bin.install "edgedb-cli-3.5.0-dev.1024+05ca024" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.5.0-dev.1024+64feab4",
        using: :nounzip
      sha256 "6585c2365d312b8e3108ebe595f8835b261c87d53c3d435594e7fa3dd673aabf"

      def install
        bin.install "edgedb-cli-3.5.0-dev.1024+64feab4" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.5.0-dev.1024+162fdd7",
        using: :nounzip
      sha256 "f1ba80b4aec07c872aeb9b2d8867b473a8943123fca8f51594bdc80d07e2d700"

      def install
        bin.install "edgedb-cli-3.5.0-dev.1024+162fdd7" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.5.0-dev.1024+59edd48",
        using: :nounzip
      sha256 "e28e17c7f73162d032abecd9bf983cd2d9d1234a300c1fb7d3b5622b1dffe839"

      def install
        bin.install "edgedb-cli-3.5.0-dev.1024+59edd48" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
