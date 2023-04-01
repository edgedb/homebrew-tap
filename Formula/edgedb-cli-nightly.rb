class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.0.0-dev.942"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.942+36e99ad?edgedb.nightly",
        using: :nounzip
      sha256 "93756a95c80f25a607f161988249b864b315f6d0e93ce9f4b751fc91d8cde89c"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.942+52199ed?edgedb.nightly",
        using: :nounzip
      sha256 "926cdcb875415caccf1a6c6902e875bda8432b3bd1f38ed9294c4f8a56198c6d"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.942+06b3ec1?edgedb.nightly",
        using: :nounzip
      sha256 "85529308051555c3991d74d1de8ddc426899c2677b38fd0b42d02ccdb9582e1d"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.942+0a46b4d?edgedb.nightly",
        using: :nounzip
      sha256 "4f0c69876c7608f7c629846601172374818581c0f7a2bbe4e0664771c3018840"
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
