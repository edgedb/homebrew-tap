class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.1.0-dev.984"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.1.0-dev.984+4fbfc9e",
        using: :nounzip
      sha256 "a6a658298e040d32cf40c9537fd750be83c57114d22c7799298aafff2f821f26"

      def install
        bin.install "edgedb-cli-3.1.0-dev.984+4fbfc9e" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.1.0-dev.984+36cc7cc",
        using: :nounzip
      sha256 "a0a7f5a765c8cb766e4fadd474ff73840cadbbd8ee00fce9f1611ccd219e4418"

      def install
        bin.install "edgedb-cli-3.1.0-dev.984+36cc7cc" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.1.0-dev.984+df0ee36",
        using: :nounzip
      sha256 "5d82cdf3cc1dad23efee7ae7cb9cd36c093a42deb57fb1d9ab90eecc7dbd3d23"

      def install
        bin.install "edgedb-cli-3.1.0-dev.984+df0ee36" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.1.0-dev.984+df0ee36",
        using: :nounzip
      sha256 "d0158322fd1ee171e4be4778756286d592de4abe72ff736be6f357eddcb7ff5f"

      def install
        bin.install "edgedb-cli-3.1.0-dev.984+df0ee36" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
