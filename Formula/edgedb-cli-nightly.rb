class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.3.0-dev.898"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.3.0-dev.898+3faf754?edgedb.nightly",
        using: :nounzip
      sha256 "ab43aded7fe01fddc0f58a3dcfb5502a532ab7283cd522baf44355d35a6b40bf"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.3.0-dev.898+3faf754?edgedb.nightly",
        using: :nounzip
      sha256 "40bee9841bb4bae4736cc2f3a70ffc6b8d2ea7b5cdc6dab0261355b9f143da5b"
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
