class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.3.0-dev.904"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.3.0-dev.904+14dde42?edgedb.nightly",
        using: :nounzip
      sha256 "7e40c5a4f2efcd8512dbd01b66613dc80dd9fd2b82bfbbe507dff01504c603bc"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.3.0-dev.904+03fa8e1?edgedb.nightly",
        using: :nounzip
      sha256 "2c97040b6009996f788a4d201412e7268f407c842e291f1e66077679bafcbf3a"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.3.0-dev.904+b4ac0ff?edgedb.nightly",
        using: :nounzip
      sha256 "769b058f3dbda60b54607a90fc63d8064b745d80871394d3cfc68e3b67abee60"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-2.3.0-dev.904+23607c2?edgedb.nightly",
        using: :nounzip
      sha256 "6b08dcaecf5e52cd1460f5c1d4d5ee0d2d4bb769ac7b08d2985042027e4301f6"
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
