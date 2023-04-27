class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.0.0-dev.968"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.968+810f40a?edgedb.nightly",
        using: :nounzip
      sha256 "62e28526f63589ccf875c719c80c07bbac61a04ba7ad610048a6dcd5bfc56811"
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
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.968+a75be6f?edgedb.nightly",
        using: :nounzip
      sha256 "1fc1ddfd7b10f1df967ee8391594fec09d430b5bf6dcb664c37a9ea66c71f1d2"
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
