class EdgedbCli < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.3.1"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin/edgedb-cli-2.3.1+5d93f42?edgedb.release",
        using: :nounzip
      sha256 "7a26c34b2bf444732ea705bb54c0de3deca7524d6063b40f57365ee4159cc931"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin/edgedb-cli-2.3.1+5d93f42?edgedb.release",
        using: :nounzip
      sha256 "10f2a1474a96e3bd3d3cc65c6a25c92be1d215980ecb16251765cbfad043482f"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl/edgedb-cli-2.3.1+b4be149?edgedb.release",
        using: :nounzip
      sha256 "af4de37ef9b9031a73fbaee4fed2a42ff036ba39fdcfb7e22c741625fcfb19a7"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl/edgedb-cli-2.3.1+ef99779?edgedb.release",
        using: :nounzip
      sha256 "3e6c0e7e535e18e12164589bf0dd0fe3e4baecc635adf1afd5aec23d0c2bccdc"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  def install
    bin.install "edgedb.release" => "edgedb"
  end

  test do
    system "#{bin}/edgedb", "--version"
  end
end
