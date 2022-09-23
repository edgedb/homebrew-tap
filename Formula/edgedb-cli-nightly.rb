class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.1.0-dev.846"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.846+05794f4?edgedb.nightly",
        using: :nounzip
      sha256 "56015efe76633309867099b5e3d0ddf13229d12830424df8e0001263daceabc2"
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
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.846+0511dfc?edgedb.nightly",
        using: :nounzip
      sha256 "ae7c52b53b5869c8fdeb4d839d5ce6b282f46e003faeba3ee58255b961f816e2"
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
