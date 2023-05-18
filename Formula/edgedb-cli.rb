class EdgedbCli < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.0.0"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin/edgedb-cli-3.0.0+80bc8b4",
        using: :nounzip
      sha256 "f1ec4a4267653e1a3bf8ffc783bd4da511d0c92470f15f2cd0198d1be47c788c"

      def install
        bin.install "edgedb-cli-3.0.0+80bc8b4" => "edgedb"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin/edgedb-cli-3.0.0+1855c84",
        using: :nounzip
      sha256 "9f4671e0d3608fe2cafa35680f196e2eee9204d36de88e954081b0b85b8f8605"

      def install
        bin.install "edgedb-cli-3.0.0+1855c84" => "edgedb"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl/edgedb-cli-3.0.0+ad4b793",
        using: :nounzip
      sha256 "b30545965a3fbce2c242c12a7c1aa621dc0a5c41fa680e213733f1bafa296ae8"

      def install
        bin.install "edgedb-cli-3.0.0+ad4b793" => "edgedb"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl/edgedb-cli-3.0.0+8b024db",
        using: :nounzip
      sha256 "81f2403287fb62074eef23efe29e5458f564b093cf6b2c76bc3b07e032f7b1b6"

      def install
        bin.install "edgedb-cli-3.0.0+8b024db" => "edgedb"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb", "--version"
  end
end
