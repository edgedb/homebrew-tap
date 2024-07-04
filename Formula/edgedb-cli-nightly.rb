class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "5.2.0-dev.1168"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-5.2.0-dev.1168+e409edd",
        using: :nounzip
      sha256 "f1adee3c26d61d607492eda284461cf33f21f142a364821cd7e5955a13cb46cb"

      def install
        bin.install "edgedb-cli-5.2.0-dev.1168+e409edd" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-5.2.0-dev.1168+e409edd",
        using: :nounzip
      sha256 "5f0fa8711d0f1d5bd60d850019b50359b265aee051130685066e7b439b78fe82"

      def install
        bin.install "edgedb-cli-5.2.0-dev.1168+e409edd" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-5.2.0-dev.1168+864bac6",
        using: :nounzip
      sha256 "99ea885b3a55cea3f21c6e57f660fd3b30cc3646b87aefb7fc2f3e5d8e5873c3"

      def install
        bin.install "edgedb-cli-5.2.0-dev.1168+864bac6" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-5.2.0-dev.1168+bb32081",
        using: :nounzip
      sha256 "886209ccb79cb5ae1655ea9043691081dbb74359b969f7bd9c50315238d2c6c4"

      def install
        bin.install "edgedb-cli-5.2.0-dev.1168+bb32081" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
