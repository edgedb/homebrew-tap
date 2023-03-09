class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.0.0-dev.926"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.926+310ff5b?edgedb.nightly",
        using: :nounzip
      sha256 "53f591027c44971d295ab2a0fae21acd67a29bdfa0d3aa09559f6b00ecede75a"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.926+a7ec4f2?edgedb.nightly",
        using: :nounzip
      sha256 "cc0fd17bd54b6890bf41544117cc0190fce7d5cfd00707e1008eb2facbcd3808"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.926+6f2a56e?edgedb.nightly",
        using: :nounzip
      sha256 "42d4d1b74fec051e25fc70d3a75da5c93bee9000af1ff4b2b5792f0707724c4e"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.926+43c18e2?edgedb.nightly",
        using: :nounzip
      sha256 "1bf718078d7982e51d33674762b83c9aa415c3da0c0229d53936c3346510c8b1"
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
