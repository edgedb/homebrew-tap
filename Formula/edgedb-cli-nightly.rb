class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "5.2.0-dev.1169"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-5.2.0-dev.1169+d52838a",
        using: :nounzip
      sha256 "39ebca92b8809ad77cc39aedb7a81159e1f6d66320e911db4196188c92ac0c11"

      def install
        bin.install "edgedb-cli-5.2.0-dev.1169+d52838a" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-5.2.0-dev.1169+d52838a",
        using: :nounzip
      sha256 "4e6e318c1bceb04bc7ee128bb80810cecd2076a43b363de7f0ad69fd33f49aa0"

      def install
        bin.install "edgedb-cli-5.2.0-dev.1169+d52838a" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-5.2.0-dev.1169+2d5c13a",
        using: :nounzip
      sha256 "a045d4a3b2166e5d39d8fd7f9707bcad824e78d4b1dc9a600a1d351eb5617e65"

      def install
        bin.install "edgedb-cli-5.2.0-dev.1169+2d5c13a" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-5.2.0-dev.1169+11d41ee",
        using: :nounzip
      sha256 "be0d0bb5c3ab6af1af36e80dfa7789fd27fbe9a0c5e4d2a92d063e527d511ef0"

      def install
        bin.install "edgedb-cli-5.2.0-dev.1169+11d41ee" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
