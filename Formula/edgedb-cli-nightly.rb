class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "5.6.0-dev.1219"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-5.6.0-dev.1219+4248fcf",
        using: :nounzip
      sha256 "f9b2db5bb3bb24806793a61097f915b3261af5bd16694f3c0a01b37c7d123e81"

      def install
        bin.install "edgedb-cli-5.6.0-dev.1219+4248fcf" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-5.6.0-dev.1219+4248fcf",
        using: :nounzip
      sha256 "672a4a2555aa0f95046d3b673d43a5366c59e09906ba905ec3c3c47f42666528"

      def install
        bin.install "edgedb-cli-5.6.0-dev.1219+4248fcf" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-5.6.0-dev.1219+65d475f",
        using: :nounzip
      sha256 "607ebd3ec22a1711175670da404dc35cc76b72fc96bb77d0734f4270d071d154"

      def install
        bin.install "edgedb-cli-5.6.0-dev.1219+65d475f" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-5.6.0-dev.1219+54dd4d9",
        using: :nounzip
      sha256 "68dc3c66b1b572833e4d13f30dd032c10a4246836e8dd3e53633f1a70c5d4a01"

      def install
        bin.install "edgedb-cli-5.6.0-dev.1219+54dd4d9" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
