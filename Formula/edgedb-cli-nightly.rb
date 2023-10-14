class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "4.0.0-dev.1045"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-4.0.0-dev.1045+29fffa4",
        using: :nounzip
      sha256 "491ced7f0f9d4c525ece20ef871c5f294b6badd560462bf611aa08b5bc4c500f"

      def install
        bin.install "edgedb-cli-4.0.0-dev.1045+29fffa4" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-4.0.0-dev.1045+3c65224",
        using: :nounzip
      sha256 "74106216ed43965e258fae3970c2a4f2084dc8f3a6866bc1cdf6d853a393fc71"

      def install
        bin.install "edgedb-cli-4.0.0-dev.1045+3c65224" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-4.0.0-dev.1045+0ef15ea",
        using: :nounzip
      sha256 "b573721b52f336da77c1c65324523f7327f41644c82e70b09a71bdc37bc7f228"

      def install
        bin.install "edgedb-cli-4.0.0-dev.1045+0ef15ea" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-4.0.0-dev.1045+f5998c8",
        using: :nounzip
      sha256 "41f4a7c01b37cc11d65143c101e4e1a32285f2f4c624a4b05f5f7988ec2aa480"

      def install
        bin.install "edgedb-cli-4.0.0-dev.1045+f5998c8" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
