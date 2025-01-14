class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "6.2.0-dev.1235"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-6.2.0-dev.1235+bbc6a35",
        using: :nounzip
      sha256 "937f027ed06bed4352a1536c8c92e83d1c9f644e2faef96b3c585d6fdb6d31e2"

      def install
        bin.install "edgedb-cli-6.2.0-dev.1235+bbc6a35" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-6.2.0-dev.1235+bbc6a35",
        using: :nounzip
      sha256 "e938dff23927efb611fe731ee85c9969bb0a604d02890fd9ca7836abea081914"

      def install
        bin.install "edgedb-cli-6.2.0-dev.1235+bbc6a35" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-6.2.0-dev.1235+f4e0366",
        using: :nounzip
      sha256 "76bd891754453cc87a5007604d21d40361e3a058c9f5a05f83854f591603ec45"

      def install
        bin.install "edgedb-cli-6.2.0-dev.1235+f4e0366" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-6.2.0-dev.1235+29096bc",
        using: :nounzip
      sha256 "f0c2c1ed425b9336f787d96dea1c3cb30fc95133b0f87b6cf86fed39d62cabdc"

      def install
        bin.install "edgedb-cli-6.2.0-dev.1235+29096bc" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
