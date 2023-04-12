class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.0.0-dev.947"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.947+b44692d?edgedb.nightly",
        using: :nounzip
      sha256 "9a20d6caff2660e4a1eeb246b760129d611ecce084f0c8212f23a614fd5e7ecf"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.947+8b573de?edgedb.nightly",
        using: :nounzip
      sha256 "3e931a11c76754512048d1b0ae083697ed0dd05907caa9a96efe1dc5ac91c3b2"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.947+17fc8ce?edgedb.nightly",
        using: :nounzip
      sha256 "339c900ce37b1e886d3aed5dda845ca28afe450505abad9b0ef3694cfec2b4d9"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.947+09cfbcb?edgedb.nightly",
        using: :nounzip
      sha256 "a309ce41bc954fcef2951f0bd20c54d7624a2ea1e97bc5682e5ea591b98a1490"
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
