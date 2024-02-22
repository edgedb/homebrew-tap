class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "4.2.0-dev.1089"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-4.2.0-dev.1089+a540757",
        using: :nounzip
      sha256 "b0b5527733cd122710e6020128391fa2ec4871f4c1f274f4cffdace66158445f"

      def install
        bin.install "edgedb-cli-4.2.0-dev.1089+a540757" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-4.2.0-dev.1089+a540757",
        using: :nounzip
      sha256 "26f04377c209bcb7a27eb1a255fe4f2482df20f91a3979a07469f0cc66ce2d15"

      def install
        bin.install "edgedb-cli-4.2.0-dev.1089+a540757" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-4.2.0-dev.1089+6af7c0e",
        using: :nounzip
      sha256 "553e1905b431041e8ff269b51c753c7e9ac6c8d5884f146c563a8ae5038289ae"

      def install
        bin.install "edgedb-cli-4.2.0-dev.1089+6af7c0e" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-4.2.0-dev.1089+accf429",
        using: :nounzip
      sha256 "ee6c6bf0fbc040533cffb53b5fb1f051d9f7c229601c2ee99763a712ab29486d"

      def install
        bin.install "edgedb-cli-4.2.0-dev.1089+accf429" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
