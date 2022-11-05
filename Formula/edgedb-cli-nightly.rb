class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.1.0-dev.865"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.865+2234c1e?edgedb.nightly",
        using: :nounzip
      sha256 "fabc91fa02caad6abe16bce3aa85b3ae33111ab141e9faf55b856461c1fc51b4"
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
