class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.1.0-dev.843"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.843+41b7c63?edgedb.nightly",
        using: :nounzip
      sha256 "f650a8657e4d1d91932fccbd1ca54fce82887d1135db7002962862c155efb871"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.843+41b7c63?edgedb.nightly",
        using: :nounzip
      sha256 "5abf62c7a7324e18e2278c4a46884c64b5d39f49c71e622b0152655f090dd76f"
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
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.843+4ab4f34?edgedb.nightly",
        using: :nounzip
      sha256 "bacc56f01d6563c1c2f9a6291468ff0f4961d3eb31f3ea282aa74a286dca2f5c"
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
