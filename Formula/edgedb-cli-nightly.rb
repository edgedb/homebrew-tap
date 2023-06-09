class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.2.0-dev.1008"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.2.0-dev.1008+cce5a7d",
        using: :nounzip
      sha256 "7507cbc6bc47bf3b2743c89329081a529de45abbe0162e1a8dc01ffc985d7432"

      def install
        bin.install "edgedb-cli-3.2.0-dev.1008+cce5a7d" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.2.0-dev.1008+e384f55",
        using: :nounzip
      sha256 "695e6dc6d52c9295497dc1d41f73b12ddf661d05a96ffbe5e17b933ee8c76809"

      def install
        bin.install "edgedb-cli-3.2.0-dev.1008+e384f55" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.2.0-dev.1008+b6f3e66",
        using: :nounzip
      sha256 "78b3a2e50c3bd634cf12351ca9f576e9f9083913f9da19b692993c81443b5a07"

      def install
        bin.install "edgedb-cli-3.2.0-dev.1008+b6f3e66" => "edgedb-nightly"
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
