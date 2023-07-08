class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.5.0-dev.1024"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.5.0-dev.1024+4a5db25",
        using: :nounzip
      sha256 "6e4076ae3056c500416411c32305888d43863041d2f17bad2bde1e3b214c8536"

      def install
        bin.install "edgedb-cli-3.5.0-dev.1024+4a5db25" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.5.0-dev.1024+d255c1f",
        using: :nounzip
      sha256 "950d0025df1ddf205b65bacf3f9bf327d20dbb735d2247680a62f13259217a44"

      def install
        bin.install "edgedb-cli-3.5.0-dev.1024+d255c1f" => "edgedb-nightly"
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
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.5.0-dev.1024+c1a21a7",
        using: :nounzip
      sha256 "100f447a8453144c59d7c1c638cc05be15303243297a63236e0b78960706fcfb"

      def install
        bin.install "edgedb-cli-3.5.0-dev.1024+c1a21a7" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
