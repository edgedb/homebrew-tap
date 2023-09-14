class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.6.0-dev.1036"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.6.0-dev.1036+315d868",
        using: :nounzip
      sha256 "6fdc347d2f569111b25a57ffedce456b14dda2e46b395de0a7b3196d8077186f"

      def install
        bin.install "edgedb-cli-3.6.0-dev.1036+315d868" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.6.0-dev.1036+c00c9ff",
        using: :nounzip
      sha256 "a3e1152e85e25ec02061ade0d07b3cdfb4967a47c191b7c81bf5736efc97a998"

      def install
        bin.install "edgedb-cli-3.6.0-dev.1036+c00c9ff" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.6.0-dev.1036+5e160fc",
        using: :nounzip
      sha256 "68bfa2d22a4121f498e32be31f9b02a621884b9c2b0ed47bf16bb285a8ca7387"

      def install
        bin.install "edgedb-cli-3.6.0-dev.1036+5e160fc" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.6.0-dev.1036+e6e361e",
        using: :nounzip
      sha256 "0cc32f8a367046e18704c4973f21b0a48e8d42486f4c8335f7f7ab5d472bf167"

      def install
        bin.install "edgedb-cli-3.6.0-dev.1036+e6e361e" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
