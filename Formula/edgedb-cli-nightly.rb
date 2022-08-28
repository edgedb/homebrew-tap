class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.1.0-dev.840"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.840+5d39fe0?edgedb.nightly",
        using: :nounzip
      sha256 "e441d6f342d180bcdb7cfd942e6ca2507366e89e4f5f595c84c74f1c6a455854"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.840+5e65a60?edgedb.nightly",
        using: :nounzip
      sha256 "c245d70e77ebeaa35d74c661b3fbd759aae7c1eb51cb0694a734da408399506d"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.840+92fe7cd?edgedb.nightly",
        using: :nounzip
      sha256 "01f4bafcf955613e96447cba1935c01d46b73fa3e24b08c297187237fe25f695"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.840+3bdc1f5?edgedb.nightly",
        using: :nounzip
      sha256 "71b1c6177281338fc37fec2d326487d7405fe9fe5394fd3f4afe35fa80111aef"
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
