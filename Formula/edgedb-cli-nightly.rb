class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.1.0-dev.857"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.857+10a4b0b?edgedb.nightly",
        using: :nounzip
      sha256 "3b1daf538004d27ffb3be259f220f5f613a84c3aaef452add9d725a4cf719241"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.857+10a4b0b?edgedb.nightly",
        using: :nounzip
      sha256 "c90d0c5b5278e050c61e04f31332037c0f9f60953dd1ab9cff7d1c2ee0e84c41"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.857+850ec27?edgedb.nightly",
        using: :nounzip
      sha256 "dd363b7ed6200f1c4d2b8759c21fbd8fc770fc59ff5b2ca8853f65e486ec03eb"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.857+78dc096?edgedb.nightly",
        using: :nounzip
      sha256 "824bd9f35b398f4a119e90efc1544deadc71d0d35cd4a43c2c2bab71f8bf6c7f"
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
