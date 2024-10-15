class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "5.5.0-dev.1193"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-5.5.0-dev.1193+bcd2f3c",
        using: :nounzip
      sha256 "5b0b61119d2d02e9c6c6baa05327fd4919d02cb389f2aa09518044ffe00638da"

      def install
        bin.install "edgedb-cli-5.5.0-dev.1193+bcd2f3c" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-5.5.0-dev.1193+d4cb0db",
        using: :nounzip
      sha256 "af73426ba81907b7e4837af285cd0e3b73e46282c28ef1875bc558c26552101f"

      def install
        bin.install "edgedb-cli-5.5.0-dev.1193+d4cb0db" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-5.5.0-dev.1193+7e722ae",
        using: :nounzip
      sha256 "9ec8f220c3f8cbc179d5d85ac86a0c23ae5e650cda6c6d0d5443868f45ad89d5"

      def install
        bin.install "edgedb-cli-5.5.0-dev.1193+7e722ae" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-5.5.0-dev.1193+7b3a3bf",
        using: :nounzip
      sha256 "6d4aca4d8b78f410aeb2954b3014f30469d55ade6db80370280cc9a7da9ce286"

      def install
        bin.install "edgedb-cli-5.5.0-dev.1193+7b3a3bf" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
