class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.1.0-dev.858"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.858+d7beb65?edgedb.nightly",
        using: :nounzip
      sha256 "73ab2dbfcf4e3a190d00cac366521281252a7597902b0d10e7888d61ff61cd2d"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.858+5c519e0?edgedb.nightly",
        using: :nounzip
      sha256 "d20089fce59efc8c0a0bd8503f5f3e69bc01b592ffccfe5efb8a7fb9a6239d93"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.858+2bc89c7?edgedb.nightly",
        using: :nounzip
      sha256 "1ec5224b88f953b99f74881986718ac603d3f38d2a5706ceb991e6c177b72009"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.858+713c63d?edgedb.nightly",
        using: :nounzip
      sha256 "07d3b8ccaae85c5ffc0a96d5d3d1c617e2c74822304f1912fe460db72511a677"
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
