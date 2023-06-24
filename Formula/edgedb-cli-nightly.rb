class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.4.0-dev.1021"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.4.0-dev.1021+5a14b9c",
        using: :nounzip
      sha256 "ea7edb6b7731c5f6127090d11d39b1013ae1af1e93762c82763cc3f589a9f415"

      def install
        bin.install "edgedb-cli-3.4.0-dev.1021+5a14b9c" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.4.0-dev.1021+9127bf3",
        using: :nounzip
      sha256 "2eb16629d4c514f40bc333cb5b298443b33e289d10a0d5417b29942f2bfddfdb"

      def install
        bin.install "edgedb-cli-3.4.0-dev.1021+9127bf3" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.4.0-dev.1021+09ebec6",
        using: :nounzip
      sha256 "9aff8109b92cad17b7b1f79801f7397f13e2e157de957c46a5c7c7a2124fb786"

      def install
        bin.install "edgedb-cli-3.4.0-dev.1021+09ebec6" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.4.0-dev.1021+8f98d4f",
        using: :nounzip
      sha256 "11393b464238e68bf42781d442b37bb01d495063fcafde3cc0ef59f126b58285"

      def install
        bin.install "edgedb-cli-3.4.0-dev.1021+8f98d4f" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
