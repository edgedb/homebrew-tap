class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.2.0-dev.871"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.2.0-dev.871+eeee01e?edgedb.nightly",
        using: :nounzip
      sha256 "aa5236791ebd690b39e68067740d6f067415b59606905b9e0a87ec2d5452a583"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.2.0-dev.871+eeee01e?edgedb.nightly",
        using: :nounzip
      sha256 "ef0e9ad3ef319853de016496d8adcf83674b347247a064178862cc99ab555b73"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.2.0-dev.871+31b509d?edgedb.nightly",
        using: :nounzip
      sha256 "e3fd680944ef9a395fa24b9780a0a0ab18b77abd2da757269837d729d6eefeb3"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-2.2.0-dev.871+d7734d7?edgedb.nightly",
        using: :nounzip
      sha256 "05dbfe5b6bc5816a11e40a9228b8603452b7302d830f630bb1f59ec49a944362"
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
