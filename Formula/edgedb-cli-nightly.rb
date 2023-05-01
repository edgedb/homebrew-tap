class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.0.0-dev.968"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.968+51881cf?edgedb.nightly",
        using: :nounzip
      sha256 "269c248dd6f3aba879fe6adb24240b1a0b8af46924b3187cb54f7460971a6587"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.968+0ee7a37?edgedb.nightly",
        using: :nounzip
      sha256 "818d56e0786d1928c3102d15453fe74a4589069dc9ed883a8f32f0fe17a8be36"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.968+0a3beed?edgedb.nightly",
        using: :nounzip
      sha256 "d3d355fd78bb8d73495b994c2beb24db049724f95a3493d8e743b03cb012bcdc"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.968+59bb5f9?edgedb.nightly",
        using: :nounzip
      sha256 "8f49adaaa3d8529391ca8ef70e1f87654eddb7544f9ced9552c373311e16a2d9"
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
