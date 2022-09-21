class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.1.0-dev.846"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.846+825397c?edgedb.nightly",
        using: :nounzip
      sha256 "4ab6b798dd6aee0fc00298b5e6e7c19a5226023cefde6638afe7d10f528b7583"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.846+2e64d97?edgedb.nightly",
        using: :nounzip
      sha256 "81ff959ba9bc06583c99202c6e080975e5d8356d76f57faf287fb1617b73b212"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.846+2c9b4ad?edgedb.nightly",
        using: :nounzip
      sha256 "ad5a1c70d17be12f0addca081ec7b3f43cf0efaa0be6a1c13343842104cc0d41"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.846+2e64d97?edgedb.nightly",
        using: :nounzip
      sha256 "bbfe0bbc7962c8c84e7c25dfc20ac5122486dad2c863c2344b0b23b33e925731"
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
