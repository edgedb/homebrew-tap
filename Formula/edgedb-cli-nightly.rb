class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "5.3.0-dev.1177"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-5.3.0-dev.1177+c818a22",
        using: :nounzip
      sha256 "faa80eb4d3ec7bb129f35fbca644f63050c89b8b563d0c1398ae93e0bd4d0b34"

      def install
        bin.install "edgedb-cli-5.3.0-dev.1177+c818a22" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-5.3.0-dev.1177+c818a22",
        using: :nounzip
      sha256 "7dfab863368231d01a901b9dd164d11c68c61bb20689d1f93e851aee01a90683"

      def install
        bin.install "edgedb-cli-5.3.0-dev.1177+c818a22" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-5.3.0-dev.1177+8dc8b8e",
        using: :nounzip
      sha256 "4a6ca93823a14dbb71490bf3ac48090805c020f9ad58b56fa467f2d41cfe1a9c"

      def install
        bin.install "edgedb-cli-5.3.0-dev.1177+8dc8b8e" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-5.3.0-dev.1177+c818a22",
        using: :nounzip
      sha256 "0382c7e7914311e28c225d776afa46ed3473ecaa0c4dda0eeb5ce4699dce479a"

      def install
        bin.install "edgedb-cli-5.3.0-dev.1177+c818a22" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
