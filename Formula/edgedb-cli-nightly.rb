class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.0.0-dev.983"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.983+f7db07b",
        using: :nounzip
      sha256 "d43b1241d0f3ebb8eedc94e19e2613eab6d53009688b6d59fe44699fa07492c9"

      def install
        bin.install "edgedb-cli-3.0.0-dev.983+f7db07b" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.983+2489f15",
        using: :nounzip
      sha256 "cffe64166d66c44f8a3ab30c118241fa7483a0c6a4c58c2d6e10c72df4455534"

      def install
        bin.install "edgedb-cli-3.0.0-dev.983+2489f15" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.983+85828d6",
        using: :nounzip
      sha256 "b7d0df8ea2a61f015ea579e543d299a2705edb2a2e33f4423ba3ba1ab0a53dc2"

      def install
        bin.install "edgedb-cli-3.0.0-dev.983+85828d6" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.983+b323d29",
        using: :nounzip
      sha256 "2909be719d2eb37c26cce400a20505bcb8c39cf85d42bd3d53847db69e31587c"

      def install
        bin.install "edgedb-cli-3.0.0-dev.983+b323d29" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
