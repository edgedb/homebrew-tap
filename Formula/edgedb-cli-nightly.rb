class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.1.0-dev.994"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.1.0-dev.994+10af711",
        using: :nounzip
      sha256 "dd8804eb5b685572dce99a6b9329f53ff80c7bc1baa28f1316336ba3f5dba314"

      def install
        bin.install "edgedb-cli-3.1.0-dev.994+10af711" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.1.0-dev.994+aeb207c",
        using: :nounzip
      sha256 "4790a82ed23504f72259eabf4eb595488cf9a232b8b801f479a2ce13ff70884a"

      def install
        bin.install "edgedb-cli-3.1.0-dev.994+aeb207c" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.1.0-dev.994+315d728",
        using: :nounzip
      sha256 "553933bfa6d83a3c6a8774f733dab0972dbf2e99f7ba8c2735d3189b098b3064"

      def install
        bin.install "edgedb-cli-3.1.0-dev.994+315d728" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.1.0-dev.994+28c93c3",
        using: :nounzip
      sha256 "5a6826a7af717efe59ab0cd225ff529f699fdb141904d7e5e77f04f233d251a2"

      def install
        bin.install "edgedb-cli-3.1.0-dev.994+28c93c3" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
