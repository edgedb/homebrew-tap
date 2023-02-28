class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.0.0-dev.920"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.920+474b63b?edgedb.nightly",
        using: :nounzip
      sha256 "55550fd383ffd6f8a599787848a5f8bad2edbc1f60ef50be89b9d193ff63694a"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.920+ef561f2?edgedb.nightly",
        using: :nounzip
      sha256 "ce2b82d71066ce95240a8b941f47ebd3ef5fa9d978570977231e3be96c4fceb9"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.920+8425210?edgedb.nightly",
        using: :nounzip
      sha256 "bd0e86c799780979e3a657b5dbaf0f4f3012b7d1edf0f782bb19b4067011857d"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.920+1a5ce75?edgedb.nightly",
        using: :nounzip
      sha256 "4162ed0e51a01058deccb2584475cbe243f294e06e5595b44af8ea4e762e723e"
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
