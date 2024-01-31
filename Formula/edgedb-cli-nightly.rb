class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "4.1.0-dev.1073"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-4.1.0-dev.1073+0590da7",
        using: :nounzip
      sha256 "27734ace04587873ea5f4dd5bbac446c39c522d8d48de57fb76de7eaf77d7d66"

      def install
        bin.install "edgedb-cli-4.1.0-dev.1073+0590da7" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-4.1.0-dev.1073+63528ba",
        using: :nounzip
      sha256 "331489cdbc1d068bb89db7304d629a5f840ed9a19db54a57dceda0b803e02d14"

      def install
        bin.install "edgedb-cli-4.1.0-dev.1073+63528ba" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-4.1.0-dev.1073+1cbbf21",
        using: :nounzip
      sha256 "f897f434fc0de071ba78861b62ff91771864f740cbc85821cfb26f188aa49cb9"

      def install
        bin.install "edgedb-cli-4.1.0-dev.1073+1cbbf21" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-4.1.0-dev.1073+a8f6329",
        using: :nounzip
      sha256 "8c3d3ff7be77760ab40180d38e674b4f4a1aa8c104dcfbe07d1d8191cfbc0cf6"

      def install
        bin.install "edgedb-cli-4.1.0-dev.1073+a8f6329" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
