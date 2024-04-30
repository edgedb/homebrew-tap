class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "5.2.0-dev.1152"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-5.2.0-dev.1152+1a930eb",
        using: :nounzip
      sha256 "b72a87ffa3c8a85303885825aff6ac7ec570bf8b2da13b585b84a216eda1adf9"

      def install
        bin.install "edgedb-cli-5.2.0-dev.1152+1a930eb" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-5.2.0-dev.1152+1a930eb",
        using: :nounzip
      sha256 "f89d30908fcb746953d481cf40901d340ff61add8474d0aa4d3f43f67dbd4591"

      def install
        bin.install "edgedb-cli-5.2.0-dev.1152+1a930eb" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-5.2.0-dev.1152+fd76fad",
        using: :nounzip
      sha256 "66cfdf41dc8b7c836f985d585403a4ed61f2d87c193dfd6182b6250401b0f42f"

      def install
        bin.install "edgedb-cli-5.2.0-dev.1152+fd76fad" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-5.2.0-dev.1152+a2c68cc",
        using: :nounzip
      sha256 "083902d2e4c061e5078eba5559f654aeaf58ac17490103eed6045e06bc7fa7fd"

      def install
        bin.install "edgedb-cli-5.2.0-dev.1152+a2c68cc" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
