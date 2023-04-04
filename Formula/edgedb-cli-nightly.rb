class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.0.0-dev.943"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.943+5eb6d6a?edgedb.nightly",
        using: :nounzip
      sha256 "187409429c571b69fcf31b894aadfce6a5fb9c662e6b0677a3fb6c7924669799"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.943+d1aab13?edgedb.nightly",
        using: :nounzip
      sha256 "3c8be1f747b690e82060b5a85d11ee13c34d80fd58393e8caf2f536d78ef0e82"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.943+4caaf6f?edgedb.nightly",
        using: :nounzip
      sha256 "198ab0a4a8decfc9f639c4337e45fefd4b63f7c3dd65f08d00573c0c22b1a98b"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.943+680c985?edgedb.nightly",
        using: :nounzip
      sha256 "b2e3a4d02dd24eb2c444c4c4dca04648ed1e193fd82735d1b11e96af923bb6b9"
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
