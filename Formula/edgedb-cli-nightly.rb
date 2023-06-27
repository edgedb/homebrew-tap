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
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.4.0-dev.1021+0f9d967",
        using: :nounzip
      sha256 "ce93570cad524f0e89d5a26726dbc5a095a061f1c54bf4608effd7939b74f1ec"

      def install
        bin.install "edgedb-cli-3.4.0-dev.1021+0f9d967" => "edgedb-nightly"
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
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.4.0-dev.1021+4305130",
        using: :nounzip
      sha256 "20f20c3b3aabfd17dd76ba5a44fb2276ab0fbb19689916b4040208c9a09b5aec"

      def install
        bin.install "edgedb-cli-3.4.0-dev.1021+4305130" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
