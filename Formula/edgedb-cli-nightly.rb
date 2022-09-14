class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.1.0-dev.844"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.844+0d80331?edgedb.nightly",
        using: :nounzip
      sha256 "3cd594cb2cd7dc7564685c3bbc955fe582e9afc0e95163656c7f3537e1549c33"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.844+83cca95?edgedb.nightly",
        using: :nounzip
      sha256 "a816a9588ceefeda4651f291294e515107236c576946d478be2bb023ab46c7a4"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.844+59f0ff2?edgedb.nightly",
        using: :nounzip
      sha256 "8d34a830ca644f56dacde12bbd145068ecb864e59d692f4da68b0f8d712d9c84"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.844+7413ac8?edgedb.nightly",
        using: :nounzip
      sha256 "ff35b8dfe808717617e5eb7378b5e4a1f03dad380248443c8070aac48355d15e"
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
