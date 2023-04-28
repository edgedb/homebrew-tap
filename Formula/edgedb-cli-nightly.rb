class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.0.0-dev.968"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.968+7e7f8a7?edgedb.nightly",
        using: :nounzip
      sha256 "a2c5d20f4ab839be178f068eacbc8b8f3c86f239df96f8dc6a1f80fed8f2e7a0"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.968+0ee7a37?edgedb.nightly",
        using: :nounzip
      sha256 "818d56e0786d1928c3102d15453fe74a4589069dc9ed883a8f32f0fe17a8be36"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.968+227675d?edgedb.nightly",
        using: :nounzip
      sha256 "237a7f35fbbd09c433ad2c8809a9d122e4ab1971605dc8654c12f16757907ea8"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.968+59bb5f9?edgedb.nightly",
        using: :nounzip
      sha256 "8f49adaaa3d8529391ca8ef70e1f87654eddb7544f9ced9552c373311e16a2d9"
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
