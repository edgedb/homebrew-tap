class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.3.0-dev.885"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.3.0-dev.885+8fca435?edgedb.nightly",
        using: :nounzip
      sha256 "3b9f4a8cdb94af8aa557abb59b08a429cf45724f6fca5f87ffbadfd6aaa0278a"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.3.0-dev.885+11ccc39?edgedb.nightly",
        using: :nounzip
      sha256 "295d953ee02216d188a232785738cf650b8208c71008fe9c4d09d88f8aa7a0a1"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.3.0-dev.885+5ddf984?edgedb.nightly",
        using: :nounzip
      sha256 "88a9f2284d9dfb8cfbf5d08ebba51260deef10e167c80fe8bdcda1c58fd8372f"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-2.3.0-dev.885+1bc4977?edgedb.nightly",
        using: :nounzip
      sha256 "0a0a221e4393880d04916f46784e062a6cd6d03abe7e12df6e97e967f773985a"
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
