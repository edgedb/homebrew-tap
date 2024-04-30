class EdgedbCli < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "5.1.0"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin/edgedb-cli-5.1.0+8ff9f85",
        using: :nounzip
      sha256 "1a242cb6338fa3b484dbfd84525d48e84bec6401af4db43b3baf19b9d004ff29"

      def install
        bin.install "edgedb-cli-5.1.0+8ff9f85" => "edgedb"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin/edgedb-cli-5.1.0+8ff9f85",
        using: :nounzip
      sha256 "c6f9648a8f20eb6068bbe9b7e68c4a6867bfd1772dfa6ac689da20b12ca4a7fb"

      def install
        bin.install "edgedb-cli-5.1.0+8ff9f85" => "edgedb"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl/edgedb-cli-5.1.0+65a0408",
        using: :nounzip
      sha256 "52a536d4c26c769d897455d8a6433f581d4d823a873df35d7666b89d77c6d6e0"

      def install
        bin.install "edgedb-cli-5.1.0+65a0408" => "edgedb"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl/edgedb-cli-5.1.0+7c5764f",
        using: :nounzip
      sha256 "9720ec593fe8262be4cb617170ca9da231771d86b416c74361531457152cc4ca"

      def install
        bin.install "edgedb-cli-5.1.0+7c5764f" => "edgedb"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb", "--version"
  end
end
