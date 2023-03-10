class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.0.0-dev.927"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.927+54b05c6?edgedb.nightly",
        using: :nounzip
      sha256 "520ebd1934872512b956b51b57fb81554cb221b039fe75f874991ce0897cf847"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.927+b9cbfe7?edgedb.nightly",
        using: :nounzip
      sha256 "b81d9ce19562b21def770dc46bfbf8e086a0f9e682b195be1ecf7b5ca6fd5cce"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.927+7245a97?edgedb.nightly",
        using: :nounzip
      sha256 "c147859f3659a512d6fdff6ae5c15e393743784bc31295bb4357338d29de9c23"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.927+6940e96?edgedb.nightly",
        using: :nounzip
      sha256 "582d7ab51026b50c0ccf890ea05c3e3636b74a4b799eaf986918e99c3cbfe7d1"
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
