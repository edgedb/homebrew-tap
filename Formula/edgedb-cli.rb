class EdgedbCli < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "4.1.0"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin/edgedb-cli-4.1.0+a8fe4d7",
        using: :nounzip
      sha256 "daeca5c99ad00fea547dd3330019aa94b212b52d3c8da10fd929427b9bcba568"

      def install
        bin.install "edgedb-cli-4.1.0+a8fe4d7" => "edgedb"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin/edgedb-cli-4.1.0+c3b6bc7",
        using: :nounzip
      sha256 "30b50ea7da403e6441be69b72602ecd6670a5e9b0b30bcdf001068c44f80e664"

      def install
        bin.install "edgedb-cli-4.1.0+c3b6bc7" => "edgedb"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl/edgedb-cli-4.1.0+b4edff4",
        using: :nounzip
      sha256 "3be53a6aae1272dc9df13b2167b78e63a28186ccdc6332fc53116d2a9be63896"

      def install
        bin.install "edgedb-cli-4.1.0+b4edff4" => "edgedb"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl/edgedb-cli-4.1.0+03ae624",
        using: :nounzip
      sha256 "bcb414ca6ce19a9dd2e8e4a0cc5613f50847466af48225a898ebac67d35f3713"

      def install
        bin.install "edgedb-cli-4.1.0+03ae624" => "edgedb"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb", "--version"
  end
end
