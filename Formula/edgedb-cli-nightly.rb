class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.1.0-dev.843"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.843+6445086?edgedb.nightly",
        using: :nounzip
      sha256 "c99bb07a148844df50843aff863b6babf1aa22d3b2cccc70e8f0133543b59b21"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.843+6445086?edgedb.nightly",
        using: :nounzip
      sha256 "2d2d98cb8a5c7228943ace61903e2b097801ce5fbb379ba07f62d7ba0727ec98"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.843+162df80?edgedb.nightly",
        using: :nounzip
      sha256 "900987083da3b4ccc9d340efa9029aea0afe5f710a0d619981bd99ea59c4f102"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.843+899269e?edgedb.nightly",
        using: :nounzip
      sha256 "1f8e4742421b731f50304d7a5bc1d696a695411243cdeb79ab5fb08ec66b40c3"
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
