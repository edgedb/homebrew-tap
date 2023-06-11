class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.2.0-dev.1008"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.2.0-dev.1008+572ff7a",
        using: :nounzip
      sha256 "93b12d8541ace73e755fdcec00efd975b515e80c1b0b458a02fa208966bcf9bb"

      def install
        bin.install "edgedb-cli-3.2.0-dev.1008+572ff7a" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.2.0-dev.1008+42cf0a0",
        using: :nounzip
      sha256 "5a4bbce902b1bf21b641a9f826405cf36959177cc77e3af0aafeaac61e270a89"

      def install
        bin.install "edgedb-cli-3.2.0-dev.1008+42cf0a0" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.2.0-dev.1008+0d3bdc6",
        using: :nounzip
      sha256 "cd21c450970d185d5afac8dad75f381523238deb4446d31ab4fad561231eeb1b"

      def install
        bin.install "edgedb-cli-3.2.0-dev.1008+0d3bdc6" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.2.0-dev.1008+155421a",
        using: :nounzip
      sha256 "f8f391b8dbc51ccd2f1fd6b2e202535ee66b25666cace632ac65a25486842fec"

      def install
        bin.install "edgedb-cli-3.2.0-dev.1008+155421a" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
