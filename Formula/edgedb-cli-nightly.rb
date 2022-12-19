class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.3.0-dev.898"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.3.0-dev.898+5874dbe?edgedb.nightly",
        using: :nounzip
      sha256 "611c847b2db0ef575bd2dbf4c132aab2839d1d3c1eaedb69c28aac45890f2ebb"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.3.0-dev.898+57b9f3a?edgedb.nightly",
        using: :nounzip
      sha256 "ae49c04f3a6b0b64e13ed91a2070006e90251c1edade9191635cddd87c0a90d1"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.3.0-dev.898+106e444?edgedb.nightly",
        using: :nounzip
      sha256 "6a1049b9eb0e757730e63dfd1c3b4d409fd9b765ed01fb0bf924eb98399605f2"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-2.3.0-dev.898+81bd2c4?edgedb.nightly",
        using: :nounzip
      sha256 "2980700424f26ea1eb2ba674c36751f45e0f87d9921f4ca89eea3d18137a7d1c"
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
