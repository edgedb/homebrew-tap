class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "4.3.0-dev.1119"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-4.3.0-dev.1119+381280a",
        using: :nounzip
      sha256 "e7180bc818f7ccc81036caa86386d3dbe9f86b4b80fce074ee311a4f3d48e74f"

      def install
        bin.install "edgedb-cli-4.3.0-dev.1119+381280a" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-4.3.0-dev.1119+9127e35",
        using: :nounzip
      sha256 "c11f99ff10da653c3250988517eaff84b18d452aaff3cf74ab1924ce18e0e42f"

      def install
        bin.install "edgedb-cli-4.3.0-dev.1119+9127e35" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-4.3.0-dev.1119+e77d89f",
        using: :nounzip
      sha256 "3a95db7cf0860de3b4b5d1668dadcb6a0bd0ef3a7a4f7af23f1821444b782b46"

      def install
        bin.install "edgedb-cli-4.3.0-dev.1119+e77d89f" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-4.3.0-dev.1119+11eb39c",
        using: :nounzip
      sha256 "3620583638f9d880a0638fd3881a0b58bbee45fcd180ee567311040b543f9eb5"

      def install
        bin.install "edgedb-cli-4.3.0-dev.1119+11eb39c" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
