class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "5.6.0-dev.1218"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-5.6.0-dev.1218+8018f9a",
        using: :nounzip
      sha256 "5cdc14c2607da9839d1c1c34b2bcad2e92516711b147b239a1245e77d413ed66"

      def install
        bin.install "edgedb-cli-5.6.0-dev.1218+8018f9a" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-5.6.0-dev.1218+8018f9a",
        using: :nounzip
      sha256 "ce04dac7964d608563122a57899560109fe94a951baacd9cbd30cc509c80f637"

      def install
        bin.install "edgedb-cli-5.6.0-dev.1218+8018f9a" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-5.6.0-dev.1218+4c41316",
        using: :nounzip
      sha256 "4504809f4270e840afa50129e2b011525018c41aadc8718c2533159488091b8b"

      def install
        bin.install "edgedb-cli-5.6.0-dev.1218+4c41316" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-5.6.0-dev.1218+851dd7e",
        using: :nounzip
      sha256 "6a1a2ad3c51fab575bc3662d075438da581319a94b8f12308bd2dd4b74efd71c"

      def install
        bin.install "edgedb-cli-5.6.0-dev.1218+851dd7e" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
