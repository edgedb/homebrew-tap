class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.0.0-dev.979"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.979+a17b0d2?edgedb.nightly",
        using: :nounzip
      sha256 "d6866538017472273a196e6ebd0456c246187fe55821c2eb083903079a65c6c8"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.979+6515a66?edgedb.nightly",
        using: :nounzip
      sha256 "ae8054821f13a7cdd5dd00c2dbca52fc26b921d6f7ca3d6c76b136935ff6fd94"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.979+c60d418?edgedb.nightly",
        using: :nounzip
      sha256 "e328a63707de99674c825686ff6093e5be85a05b8f849294f5aa18de14d42ccd"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.979+4666c49?edgedb.nightly",
        using: :nounzip
      sha256 "94c69c046b45f0b708eaf30242907f191f0734f1403538b85492f8df1b24ec6a"
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
