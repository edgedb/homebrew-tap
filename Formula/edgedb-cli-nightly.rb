class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.2.0-dev.872"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.2.0-dev.872+115872b?edgedb.nightly",
        using: :nounzip
      sha256 "dce3f6c38b81565cfef1de9279300bf260e77e72265d88ff5d8b64d5a9134e1e"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.2.0-dev.872+23de998?edgedb.nightly",
        using: :nounzip
      sha256 "3e93984efaeae480ea04e37b0eb4ab2edda5d0a8e88b3bc3060bca79d7437030"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.2.0-dev.872+02b0207?edgedb.nightly",
        using: :nounzip
      sha256 "9abfc6958b24c7d2fe60740ffba8c86a1b01056ce4dbf95c83f21a70d78e70b3"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-2.2.0-dev.872+22d4b66?edgedb.nightly",
        using: :nounzip
      sha256 "a366fe62513aadd05fb9d47a444b511324f1dd3ad33b122e9c6ce1da8d0b3fa1"
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
