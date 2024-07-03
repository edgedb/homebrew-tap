class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "5.2.0-dev.1167"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-5.2.0-dev.1167+32c2d4d",
        using: :nounzip
      sha256 "b5e437bb6918bd7f0bd5e6d423f26a3d9ec527150f237f5552644eab52c5e17a"

      def install
        bin.install "edgedb-cli-5.2.0-dev.1167+32c2d4d" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-5.2.0-dev.1167+32c2d4d",
        using: :nounzip
      sha256 "c628c5bba3c5eec33e4a01ecf6d6e7b1b22eaea2f20fff7f2563ebe9cff8e36d"

      def install
        bin.install "edgedb-cli-5.2.0-dev.1167+32c2d4d" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-5.2.0-dev.1167+360f7a2",
        using: :nounzip
      sha256 "546b1dc1a2a47887d08f5a2977c353a9ac709d2fd232807c0f7287c962f6acef"

      def install
        bin.install "edgedb-cli-5.2.0-dev.1167+360f7a2" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-5.2.0-dev.1167+3e46c76",
        using: :nounzip
      sha256 "ad444d871cd820f3574d763aadf992015be2f6d3d89d79c51f01d3d860b89ada"

      def install
        bin.install "edgedb-cli-5.2.0-dev.1167+3e46c76" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
