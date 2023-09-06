class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.5.0-dev.1026"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.5.0-dev.1026+1093243",
        using: :nounzip
      sha256 "93c208bf8e0c8c24cdf5128745bce5ac1145e7d4ed91298e9d5f9559c2cc4a62"

      def install
        bin.install "edgedb-cli-3.5.0-dev.1026+1093243" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.5.0-dev.1026+1545d8f",
        using: :nounzip
      sha256 "f5ab0fbe9c124399292a23cbe4ba54fdb235dfce8d29bee45f66dbbbd18b5b86"

      def install
        bin.install "edgedb-cli-3.5.0-dev.1026+1545d8f" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.5.0-dev.1026+0329493",
        using: :nounzip
      sha256 "35015ede75296c18ae3dabae6a54c722ad72ffe017ec7f70c2504048c909a21f"

      def install
        bin.install "edgedb-cli-3.5.0-dev.1026+0329493" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.5.0-dev.1026+01be12d",
        using: :nounzip
      sha256 "76b13bce86546c30f8fa351e937c875988c30b88887bd708fc825c943f9701ac"

      def install
        bin.install "edgedb-cli-3.5.0-dev.1026+01be12d" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
