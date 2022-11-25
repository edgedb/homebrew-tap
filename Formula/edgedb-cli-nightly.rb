class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.3.0-dev.889"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.3.0-dev.889+2d3dd52?edgedb.nightly",
        using: :nounzip
      sha256 "90f6ca1955b2b7d60c8fe9e688995d340877424649d393efbd03f96f2e82d0eb"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.3.0-dev.889+2d3dd52?edgedb.nightly",
        using: :nounzip
      sha256 "df0e2beb56138c83e45a16be52ca598b474e943072d455af737c0381a3d8a6c2"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.3.0-dev.889+e3371b1?edgedb.nightly",
        using: :nounzip
      sha256 "3286f86fea00e7e82aee709a112312e02dc8c411f4320058c0b55f0f30bbe830"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-2.3.0-dev.889+167612b?edgedb.nightly",
        using: :nounzip
      sha256 "64663b2f5763c46f25ead77bae79404522c0a873777424aa673807963dda79ab"
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
