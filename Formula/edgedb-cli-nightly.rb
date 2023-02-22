class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.0.0-dev.913"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.913+355c0d9?edgedb.nightly",
        using: :nounzip
      sha256 "9c43e0a79644d50979f451421e3f185ed58b8a0be9b4397ba6e1788f2e95102f"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.913+2ee5851?edgedb.nightly",
        using: :nounzip
      sha256 "42b1392214644f10515c21ce863bf532c7e712a45b9640d3b2027737df906209"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.913+6dfe7e9?edgedb.nightly",
        using: :nounzip
      sha256 "47f56385954f3bd974bb2b14ccc8f50b2f6a3133068e4c3301def729a4092ebb"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.913+1d3b06e?edgedb.nightly",
        using: :nounzip
      sha256 "125a32104292097f5eb4339e8140c9c47e5733d0fa59421fd225ebef2ccc87c6"
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
