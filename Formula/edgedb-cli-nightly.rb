class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.1.0-dev.840"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.840+0959ed2?edgedb.nightly",
        using: :nounzip
      sha256 "86a1a4a4f1bc11492b98cd9df5336c1a88fe565e1fa3c51a07c7f63b17585fb8"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.840+1ef3109?edgedb.nightly",
        using: :nounzip
      sha256 "2b2a745c09ca9fb3426f5a297c5f4454703d91f963ddb19e5bde1d8ada618752"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.840+3ac5fbf?edgedb.nightly",
        using: :nounzip
      sha256 "2ab36a06a864d12bed34f8863e8a075749d2426dd00ee0c061b78a09b89ede28"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.840+3bdc1f5?edgedb.nightly",
        using: :nounzip
      sha256 "71b1c6177281338fc37fec2d326487d7405fe9fe5394fd3f4afe35fa80111aef"
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
