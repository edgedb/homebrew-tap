class EdgedbCli < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "5.0.0"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin/edgedb-cli-5.0.0+c9dfeec",
        using: :nounzip
      sha256 "758a4eb5d1ec7ab7f417048061130c955ea647b7086a03767e1cd626116dc5aa"

      def install
        bin.install "edgedb-cli-5.0.0+c9dfeec" => "edgedb"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin/edgedb-cli-5.0.0+c9dfeec",
        using: :nounzip
      sha256 "e3512afe3b3fc630809e0f5cf97ccd5ce3fb7725599b62634de76cda93eb5918"

      def install
        bin.install "edgedb-cli-5.0.0+c9dfeec" => "edgedb"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl/edgedb-cli-5.0.0+a980b35",
        using: :nounzip
      sha256 "e671246ec94ebab829b27b3e4d5edcb6feea3643aaad8712f9647c893287e0e2"

      def install
        bin.install "edgedb-cli-5.0.0+a980b35" => "edgedb"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl/edgedb-cli-5.0.0+c9dfeec",
        using: :nounzip
      sha256 "707454a3559d2970387bd6cc837409542661b2a64359d3bda1568a4d4aa5f9ee"

      def install
        bin.install "edgedb-cli-5.0.0+c9dfeec" => "edgedb"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb", "--version"
  end
end
