class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.1.0-dev.858"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.858+0c7f718?edgedb.nightly",
        using: :nounzip
      sha256 "59162c088b603bb857eca7690a481b8c6a774ffe9391f745264025ed333986c5"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.858+2349736?edgedb.nightly",
        using: :nounzip
      sha256 "a32987ebabc5d961993e10e08f78cbd5f411f53f168248e2a15dd8d089505e86"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.858+2bc89c7?edgedb.nightly",
        using: :nounzip
      sha256 "1ec5224b88f953b99f74881986718ac603d3f38d2a5706ceb991e6c177b72009"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.858+713c63d?edgedb.nightly",
        using: :nounzip
      sha256 "07d3b8ccaae85c5ffc0a96d5d3d1c617e2c74822304f1912fe460db72511a677"
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
