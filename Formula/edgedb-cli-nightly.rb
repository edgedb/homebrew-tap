class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.3.0-dev.893"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.3.0-dev.893+4c3ed52?edgedb.nightly",
        using: :nounzip
      sha256 "16983a6314f74625914a11ae18804b5398cbb00b30f6ec5b1b69948c957fc166"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.3.0-dev.893+4c3ed52?edgedb.nightly",
        using: :nounzip
      sha256 "5b9789e0d294b1052925a4bc91189fd5eec19a1835d881f8e16b171d5ac4712e"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.3.0-dev.893+e9563a0?edgedb.nightly",
        using: :nounzip
      sha256 "5fb9a986be34a61bda64bfcea3ff770daa7ca5fd1b831c8986205995c010d745"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-2.3.0-dev.893+d4592f7?edgedb.nightly",
        using: :nounzip
      sha256 "1c3e0a0961d8a8fea21683c02be845eb4ec907a16579e95a99e3f6220b522a46"
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
