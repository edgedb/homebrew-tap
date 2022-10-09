class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.1.0-dev.856"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.856+0318bd2?edgedb.nightly",
        using: :nounzip
      sha256 "a45af42e19dd48ca80b662c85dc3f37ee43d28f5d602ee03c9b102047761a4cf"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.856+0318bd2?edgedb.nightly",
        using: :nounzip
      sha256 "ec0442b1ed2c61e15b04b375b78679f6e5937b9d3cf7506c6e017bfe9d29f9da"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.856+2245226?edgedb.nightly",
        using: :nounzip
      sha256 "7d91c154b00d814e1c5e7a0d5f8f7e28b50e75af3da81707b4f6c9b8d0140822"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.856+1620b08?edgedb.nightly",
        using: :nounzip
      sha256 "c86113202d13314908f3eb354d300b4d471b0b843b99584439c338fb772d78db"
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
