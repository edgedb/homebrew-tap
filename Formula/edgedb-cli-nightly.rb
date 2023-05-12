class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.0.0-dev.982"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.982+7a34ef9",
        using: :nounzip
      sha256 "f7ed671bded0670adc7b793fc16da1fbec8348d0fe9f41fd0fe0c738953213d3"

      def install
        bin.install "edgedb-cli-3.0.0-dev.982+7a34ef9" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.982+04a2764",
        using: :nounzip
      sha256 "1058ac2fc27ae26c5d7202d6542711b139f6c9082436497b3c3b5f764f9e280e"

      def install
        bin.install "edgedb-cli-3.0.0-dev.982+04a2764" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.982+248bb29",
        using: :nounzip
      sha256 "ddcbdf2cab5ccabee9202b5a6bd33115f67983f5e4754cd93fa3be898ba12ef4"

      def install
        bin.install "edgedb-cli-3.0.0-dev.982+248bb29" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.982+c2166fb",
        using: :nounzip
      sha256 "29d107f5d75bca1326b173394ddb65efcac7bcb90630e15d0023fc51de8a52a9"

      def install
        bin.install "edgedb-cli-3.0.0-dev.982+c2166fb" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
