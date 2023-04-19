class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.0.0-dev.951"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.951+16234cc?edgedb.nightly",
        using: :nounzip
      sha256 "902106862c244240c0fdb3c67b7f1c02b39b002a20a99b8c1173e10426936948"
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
