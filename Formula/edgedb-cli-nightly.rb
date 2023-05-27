class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.1.0-dev.998"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.1.0-dev.998+95c1b44",
        using: :nounzip
      sha256 "b24e28aef4a6d0b2e973b18c5c048e89f9d8393d03ddc4a138587c50b764253f"

      def install
        bin.install "edgedb-cli-3.1.0-dev.998+95c1b44" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.1.0-dev.998+11b30a7",
        using: :nounzip
      sha256 "c0a7b1c9e8fa540f26626ebec5a34f86ff64c656e7cca583caa124e767da00a3"

      def install
        bin.install "edgedb-cli-3.1.0-dev.998+11b30a7" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.1.0-dev.998+14507d5",
        using: :nounzip
      sha256 "ba1365a16f0b5d0e8cf03dd5cdd711fc2f14593104b9b83eebcd9c50d5107f00"

      def install
        bin.install "edgedb-cli-3.1.0-dev.998+14507d5" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.1.0-dev.998+0798c75",
        using: :nounzip
      sha256 "a09f9edab81df38c5b53a20f72f1d1c3b561fac76a80fa8a1166611611088fce"

      def install
        bin.install "edgedb-cli-3.1.0-dev.998+0798c75" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
