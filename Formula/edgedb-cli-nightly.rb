class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.1.0-dev.994"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.1.0-dev.994+4a1acdb",
        using: :nounzip
      sha256 "a78eb267ec927b432dd76bd10580f7189b0577ec46e76465fdafde57e4f0c000"

      def install
        bin.install "edgedb-cli-3.1.0-dev.994+4a1acdb" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.1.0-dev.994+d2e44df",
        using: :nounzip
      sha256 "e00a0c87f8ae1b3bdd5cbb31e94a530090170bf45e2d09dcfa43d929900bc7f0"

      def install
        bin.install "edgedb-cli-3.1.0-dev.994+d2e44df" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.1.0-dev.994+70ebcfc",
        using: :nounzip
      sha256 "cfa8031866e5128b1fa60077102ca3f424f6b212490c3bc04b02ac3845af6288"

      def install
        bin.install "edgedb-cli-3.1.0-dev.994+70ebcfc" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.1.0-dev.994+4608325",
        using: :nounzip
      sha256 "13a44ccbf7fdab0963eac8fb40cd7c19fd8d8a1443024ecb14442af1ae440022"

      def install
        bin.install "edgedb-cli-3.1.0-dev.994+4608325" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
