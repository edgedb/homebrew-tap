class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.0.0-dev.942"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.942+81600d2?edgedb.nightly",
        using: :nounzip
      sha256 "5de072b73f7b2748f503cabae9a4df81345442c6c231e67aff8abcee4cd38eaa"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.942+871c6f5?edgedb.nightly",
        using: :nounzip
      sha256 "fb811d381be4f38986b05ac96b4f463073b58c9409397e1fc10424e68277fa37"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.942+74ca6ca?edgedb.nightly",
        using: :nounzip
      sha256 "115ff44d385624beb305e3faf8460fbcdbc9ce8d6b377b964e3ac0c12e6b4b17"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.942+8fce5aa?edgedb.nightly",
        using: :nounzip
      sha256 "af2f432ddcc6f1118b8774b1e05d6485293928fad7f4285a4fb5767a24d07a09"
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
