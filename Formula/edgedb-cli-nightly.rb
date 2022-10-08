class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.1.0-dev.856"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.856+81fd535?edgedb.nightly",
        using: :nounzip
      sha256 "0dd87895e08b3a3e3c4cb7c1198508750ed4c80375482ce0799a4cd868a9a0f0"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.856+81fd535?edgedb.nightly",
        using: :nounzip
      sha256 "082dc52fd2edd307d990a7ef4a368d03f493421012138c9d153f3ac8f7543cfb"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.856+2245226?edgedb.nightly",
        using: :nounzip
      sha256 "7d91c154b00d814e1c5e7a0d5f8f7e28b50e75af3da81707b4f6c9b8d0140822"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.856+b49c3d2?edgedb.nightly",
        using: :nounzip
      sha256 "ac24690836df992fabb3bd4bb2bdeaad79f91bc441ee5351dbb8ff6700cbb4fa"
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
