class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.1.0-dev.864"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.864+45516fb?edgedb.nightly",
        using: :nounzip
      sha256 "6c7d5b701b71e1069547f636ea6237d139073e44133fe2e7c66f137f1228a1bf"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.864+f19b6b7?edgedb.nightly",
        using: :nounzip
      sha256 "6fafdd3c3675ce8a654d550de76b2fa1e7baafaaa92599bd8090e2f6e974968f"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.864+d491f81?edgedb.nightly",
        using: :nounzip
      sha256 "0225457369bbee5106d5b83063077fe8f3cff381d1036f17429b7c9e4238f8b1"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.864+53d7934?edgedb.nightly",
        using: :nounzip
      sha256 "9013db5393afbedd4e3a3b63e997533a9f6c062defe522db3564ecda156b2a28"
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
