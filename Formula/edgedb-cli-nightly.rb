class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.0.0-dev.951"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.951+5e2c3e9?edgedb.nightly",
        using: :nounzip
      sha256 "d799089c49271a00093129a06c2fe8eb7041c4ccd18327037ea31ef3138d2794"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.951+13df9e3?edgedb.nightly",
        using: :nounzip
      sha256 "9a6c09f688c1433ff5d9b8b5f9f07499ac1be6cd926bb62dad9d79694852b0fe"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.951+2573484?edgedb.nightly",
        using: :nounzip
      sha256 "e9c0337cefeeb8ebd25092d8245dced2db8214e11b448b4360eaedea397ba77c"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.951+18147bb?edgedb.nightly",
        using: :nounzip
      sha256 "cb5615355bda7470e6a19716dcebb1b9d0bf5b1d410ea39a2c8f13024c8de1a0"
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
