class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "4.0.0-dev.1042"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-4.0.0-dev.1042+d43a461",
        using: :nounzip
      sha256 "771e2c10d3301ee1a491fa8982980d27b0ce063d00ffb00976771c88673ac568"

      def install
        bin.install "edgedb-cli-4.0.0-dev.1042+d43a461" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-4.0.0-dev.1042+4acd3a0",
        using: :nounzip
      sha256 "6dd62ecb5784a10af1b1565d8e0a59df8274f02ad0cd74ac77d20ccf74153776"

      def install
        bin.install "edgedb-cli-4.0.0-dev.1042+4acd3a0" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-4.0.0-dev.1042+cc90cd8",
        using: :nounzip
      sha256 "20c3160cc8e8f066ef6f45a4a1b6b82ebda174d2fd0deda4d885520abe7726c9"

      def install
        bin.install "edgedb-cli-4.0.0-dev.1042+cc90cd8" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-4.0.0-dev.1042+9874c6e",
        using: :nounzip
      sha256 "eb803df180bfe4857936a8fd2e1b41fc97c6e2b8feda020e9988be91bd59ab6c"

      def install
        bin.install "edgedb-cli-4.0.0-dev.1042+9874c6e" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
