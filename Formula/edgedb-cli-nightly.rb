class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.1.0-dev.857"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.857+3ff6d22?edgedb.nightly",
        using: :nounzip
      sha256 "f8bca6dd99dd6215128b1dd7b8a107be6ca4bfdff8532f23df059d537e360078"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.857+6678168?edgedb.nightly",
        using: :nounzip
      sha256 "df341bb22a7ca959234ab1c6a85f54f194e4c5087029f34346209f2caa24e7fc"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.857+91a8eb3?edgedb.nightly",
        using: :nounzip
      sha256 "c25cb04f71a9b720c4f6944fdd0769bebc26dc0d04a1a833255ea57f4a8a7220"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.857+88dcb47?edgedb.nightly",
        using: :nounzip
      sha256 "9958634693efa4f8acad4d8c7b944c937a2eeece033d24d97f5baca2349dda7b"
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
