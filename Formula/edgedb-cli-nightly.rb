class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.4.0-dev.1021"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.4.0-dev.1021+9d6f5ce",
        using: :nounzip
      sha256 "a5df78b07719e164e0b216e7431ccc7079765abeec8765f7705f0b09d962a142"

      def install
        bin.install "edgedb-cli-3.4.0-dev.1021+9d6f5ce" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.4.0-dev.1021+c5a6753",
        using: :nounzip
      sha256 "779a02c7f91b31fccd58430f6518b89a080d97177519b8c5cfbb64943cca44ca"

      def install
        bin.install "edgedb-cli-3.4.0-dev.1021+c5a6753" => "edgedb-nightly"
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
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.4.0-dev.1021+afababc",
        using: :nounzip
      sha256 "cb6881a56a8b7665d32af060da04ad85cc87a06904976659460a0a3c91faedee"

      def install
        bin.install "edgedb-cli-3.4.0-dev.1021+afababc" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
