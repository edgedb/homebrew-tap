class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.1.0-dev.839"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.839+066dcd7?edgedb.nightly",
        using: :nounzip
      sha256 "d00c4b057d059055037be11e5c2ffc8729f06340d015831fec6be5aa1a539c79"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.839+066dcd7?edgedb.nightly",
        using: :nounzip
      sha256 "6173830d04342b8e237babd2646b453edf4f8e25bf84a01d6ea1b21367bfd754"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.839+8ce2ced?edgedb.nightly",
        using: :nounzip
      sha256 "a588bb22f70699d981b4f21ab3dc43e8efc9cf36b9d885c0a1038550615f1c47"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.839+59bac54?edgedb.nightly",
        using: :nounzip
      sha256 "255e28e818d49117eb5dc819dfcbe1bd6e01766074a700851f79d1522b77e293"
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
