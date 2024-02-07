class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "4.1.0-dev.1076"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-4.1.0-dev.1076+7375bf5",
        using: :nounzip
      sha256 "51846fa928a86dd75bc9d14e24609c4f4cd36fc972d9e8b57b6325affbd3eb1b"

      def install
        bin.install "edgedb-cli-4.1.0-dev.1076+7375bf5" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-4.1.0-dev.1076+0c8489a",
        using: :nounzip
      sha256 "8b96c2b69d66fc77ea89d141ede1df46ffe7000998073948de020b2a43662782"

      def install
        bin.install "edgedb-cli-4.1.0-dev.1076+0c8489a" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-4.1.0-dev.1076+97ee79b",
        using: :nounzip
      sha256 "02798ef1778af9ab2f622f0ce56ee4f30f672810fd9d1863a19cb6508251b09e"

      def install
        bin.install "edgedb-cli-4.1.0-dev.1076+97ee79b" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-4.1.0-dev.1076+f1e0e0a",
        using: :nounzip
      sha256 "962eed413f718fff3d96d3e64728b8ef4d18027da795485de02feb85d5a1ddda"

      def install
        bin.install "edgedb-cli-4.1.0-dev.1076+f1e0e0a" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
