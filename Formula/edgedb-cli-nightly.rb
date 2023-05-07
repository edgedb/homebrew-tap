class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.0.0-dev.979"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.979+44e8134?edgedb.nightly",
        using: :nounzip
      sha256 "a0f3e1b522ea9f1f712f4480f197ca4fa526416573729692535312c883fd3f91"
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
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.979+2eec845?edgedb.nightly",
        using: :nounzip
      sha256 "ec627fa3e6115fddd778f4e06ebbe5be0b555067f4c515910a60351cd672fab8"
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
