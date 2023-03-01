class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.0.0-dev.920"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.920+474b63b?edgedb.nightly",
        using: :nounzip
      sha256 "55550fd383ffd6f8a599787848a5f8bad2edbc1f60ef50be89b9d193ff63694a"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.920+7a45f9a?edgedb.nightly",
        using: :nounzip
      sha256 "3ed00f95b92ac3880ff2fba83a96c5b9fe065bc967ec79f18cbfbe3969a661f3"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.920+00aff66?edgedb.nightly",
        using: :nounzip
      sha256 "4b2f59e56446f22108fbb0294bda4acd461d92cfb230a819b62760df32adec56"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.920+1a5ce75?edgedb.nightly",
        using: :nounzip
      sha256 "4162ed0e51a01058deccb2584475cbe243f294e06e5595b44af8ea4e762e723e"
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
