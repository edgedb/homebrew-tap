class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "4.1.0-dev.1065"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-4.1.0-dev.1065+d57b00e",
        using: :nounzip
      sha256 "5e16f9e703e2f755a05d5ba37212be387b0750e1d6479a500614ecf987c3f116"

      def install
        bin.install "edgedb-cli-4.1.0-dev.1065+d57b00e" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-4.1.0-dev.1065+4ec15a9",
        using: :nounzip
      sha256 "8f14699c9f2d699b3d46c09a95180096821dd349bd20613d66cbf1fcb6007f0e"

      def install
        bin.install "edgedb-cli-4.1.0-dev.1065+4ec15a9" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-4.1.0-dev.1065+92d600c",
        using: :nounzip
      sha256 "06f7f327f9c1a4249b44db56d33bb21c70bfab6ce710e17894415d07825b3d6a"

      def install
        bin.install "edgedb-cli-4.1.0-dev.1065+92d600c" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-4.1.0-dev.1065+76a85b8",
        using: :nounzip
      sha256 "2bcbdcbdd9fce3898f3f8957097069924802f7be9085815cbf8fdd0237f41770"

      def install
        bin.install "edgedb-cli-4.1.0-dev.1065+76a85b8" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
