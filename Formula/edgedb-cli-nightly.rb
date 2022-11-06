class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.1.0-dev.865"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.865+1058fe8?edgedb.nightly",
        using: :nounzip
      sha256 "8f0754e8e8e052a672aea5172d1db8ceacc8fbb812e0f0448005a6940c09919e"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.865+2234c1e?edgedb.nightly",
        using: :nounzip
      sha256 "2eb101acad758ab052e286f664a335dad8582adfb8c655d8255c7720b7dba90d"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.865+27f54e1?edgedb.nightly",
        using: :nounzip
      sha256 "afd64c8703f1488828b3d7d3dffa1f0ee19334400719de59c9c3012e52fcbef6"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.865+40c556b?edgedb.nightly",
        using: :nounzip
      sha256 "8747ad638b30569dc837a9d852003d6de2e9deaa84711fb468037660b15a3b27"
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
