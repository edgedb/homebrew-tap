class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.0.0-dev.945"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.945+37a2df6?edgedb.nightly",
        using: :nounzip
      sha256 "c3dce54be755b10ce5e153638ae0aa8bec570cfac648be5ed4de478fee7dd321"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.945+76da946?edgedb.nightly",
        using: :nounzip
      sha256 "f797faf698fc229038c1a351fa9b6c128c8ea808b93a8cab104818e77fa6adeb"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.945+97be698?edgedb.nightly",
        using: :nounzip
      sha256 "7416539e80c8ab97ab456c5398ecfe7942832aef914c7e90132c107414fba182"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.945+35cf550?edgedb.nightly",
        using: :nounzip
      sha256 "c85b8025731d4085b7bac45c981ab672c027341f8f221c6bcd5f9dc4d7f2aa75"
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
