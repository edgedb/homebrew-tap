class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.0.0-dev.917"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.917+2ecaea6?edgedb.nightly",
        using: :nounzip
      sha256 "0e95ac30b19dee507a30ca8bf371f370e1ba72aef47541b072bad28c4bcc0594"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.917+0fd8ca9?edgedb.nightly",
        using: :nounzip
      sha256 "9fb0d08cebcaed30e7db9e9cb2ce95a53cfbe2dbc14e2b8a8342f8a0b28f7aa7"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.917+769e5d2?edgedb.nightly",
        using: :nounzip
      sha256 "7f2be3dfb770606f07b76762ce1ef9482836d455384a3754c1e2d1d45c30a080"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.917+07da649?edgedb.nightly",
        using: :nounzip
      sha256 "9f305f6857ad36271ce359419796a5a019cab28a534f43f5af66c7524cb36425"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  def install
    bin.install "edgedb.nightly" => "edgedb-nightly"
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
