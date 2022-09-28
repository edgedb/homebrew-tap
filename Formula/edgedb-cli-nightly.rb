class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.1.0-dev.850"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.850+2f25848?edgedb.nightly",
        using: :nounzip
      sha256 "7422e27785cce7e37a45b9c506c442d29abfa960e2d38f5c250548b1f40166fb"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.850+409c8dc?edgedb.nightly",
        using: :nounzip
      sha256 "d9a8469e04d554aa4932827d7c2ad0dab5d8d914bf2d5df0bc7798f30facdd55"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.850+1bff0b3?edgedb.nightly",
        using: :nounzip
      sha256 "6ec329ab208f378410988d2453667d2a59c9816f40298eaf930a068c5fb48b7f"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.850+8dd8e23?edgedb.nightly",
        using: :nounzip
      sha256 "ee86ff7cf99f9bf610f06d947f8f3158231bfac6bc4d79d493314235f270ee10"
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
