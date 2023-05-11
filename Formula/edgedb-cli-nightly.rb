class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.0.0-dev.982"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.982+7a34ef9",
        using: :nounzip
      sha256 "f7ed671bded0670adc7b793fc16da1fbec8348d0fe9f41fd0fe0c738953213d3"

      def install
        bin.install "edgedb-cli-3.0.0-dev.982+7a34ef9" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.982+1a78685",
        using: :nounzip
      sha256 "4c252fc68f0d4128113bf2407405efda299404cbefaddeeda0958d95efc5cb90"

      def install
        bin.install "edgedb-cli-3.0.0-dev.982+1a78685" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.982+561027e",
        using: :nounzip
      sha256 "3b718fc9721e8bdc2c143ce39468a459f2328155408d6f890ce6915327f09971"

      def install
        bin.install "edgedb-cli-3.0.0-dev.982+561027e" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.982+d089f21",
        using: :nounzip
      sha256 "a4ba663e063bdaf6af61f4c665ead0b0c635110102d200a542a9f6f4870d098f"

      def install
        bin.install "edgedb-cli-3.0.0-dev.982+d089f21" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
