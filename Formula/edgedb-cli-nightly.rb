class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.3.0-dev.895"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.3.0-dev.895+1d1772a?edgedb.nightly",
        using: :nounzip
      sha256 "60efad6c2913f0fdc32613f410c8c13730a2523c4e3e535d794c06dddcd276b5"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.3.0-dev.895+75b1a64?edgedb.nightly",
        using: :nounzip
      sha256 "6dbd1c450a6bd842b80016632ccb11d2af64abcf2216f8644470760d95fc16d3"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.3.0-dev.895+66c485c?edgedb.nightly",
        using: :nounzip
      sha256 "a24ae2c53ec509d47673635263cde7b124643baf251dc5eecc7166dd81deb4d6"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-2.3.0-dev.895+73b906d?edgedb.nightly",
        using: :nounzip
      sha256 "e297b232c97920c6f3a1f683264296c70d88463f3c4c570bef1da1f84318a37e"
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
