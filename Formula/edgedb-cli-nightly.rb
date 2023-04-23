class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.0.0-dev.960"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.960+56f0250?edgedb.nightly",
        using: :nounzip
      sha256 "74f47237fbfbc82df5756bfa21d245e2f6056469084b734b64a4ce3958928b3a"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.960+213ae8a?edgedb.nightly",
        using: :nounzip
      sha256 "bf58c6a7f07f9b85ea0ffc73a5d04a405209befe8f4c03f1b045e5407ca9957c"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.960+3caf63e?edgedb.nightly",
        using: :nounzip
      sha256 "0b7bee880ca362042657fc45f8cf1f3e3425007b9693f69b53ef57e74de94004"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.960+dee5d68?edgedb.nightly",
        using: :nounzip
      sha256 "0a53b52b3587dae44ef24d99e1b1b61f6e201d194beeecabb7055c0eaf9be104"
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
