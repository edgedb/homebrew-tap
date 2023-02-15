class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.3.0-dev.911"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.3.0-dev.911+53308b8?edgedb.nightly",
        using: :nounzip
      sha256 "d83b7df6d1a4a25a2a3a0d40568919832acbf5df5428a2bf312d644d413c1341"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.3.0-dev.911+097a927?edgedb.nightly",
        using: :nounzip
      sha256 "385cb8bc75ee556b1cd6234ff2a77a08356e1d5c5df6dcf73b6f14157cb18a02"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.3.0-dev.911+16fe7fa?edgedb.nightly",
        using: :nounzip
      sha256 "06b2c592e88021cd992832e1cd34be91d625e7c2a060c482d255b268fd805705"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-2.3.0-dev.911+0721ad7?edgedb.nightly",
        using: :nounzip
      sha256 "c0def873708423a86756ca7c2cb224594544ee940bf337615b0e92bf030d1524"
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
