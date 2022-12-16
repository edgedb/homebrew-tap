class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.3.0-dev.897"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.3.0-dev.897+10d6e6e?edgedb.nightly",
        using: :nounzip
      sha256 "a5287b4a70e3dada2d873e5d09fcc8c6283cda03b24aba688141de4e196397b5"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.3.0-dev.897+574d2d3?edgedb.nightly",
        using: :nounzip
      sha256 "146fbb18af892929b1ba2044916358b86a8f67558b3ad3bfc79cdfea66f5b9ea"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.3.0-dev.897+46193c6?edgedb.nightly",
        using: :nounzip
      sha256 "e8e8016ed0d042dce8f4f9ea69bf821473faab53ce31f6678e7bdfd1d3da175e"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-2.3.0-dev.897+3d10c2c?edgedb.nightly",
        using: :nounzip
      sha256 "fdd14ff2b63864673fbc2ca8248341b8bbf40df61b2327228090c0f181860d63"
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
