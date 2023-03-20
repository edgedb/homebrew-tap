class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.0.0-dev.939"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.939+08502cf?edgedb.nightly",
        using: :nounzip
      sha256 "091da8c8247a4207d621275785bd7876d4eb2acabaeae92a6e8a448c8c9b71fc"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.939+26948c3?edgedb.nightly",
        using: :nounzip
      sha256 "f32038ae7c950019eb0cf4b0523b583ade0279274e48631582b4ffd9b284a98f"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.939+00e508d?edgedb.nightly",
        using: :nounzip
      sha256 "9f2d7c3939966358a19f4428c7998630c3ac070bcf1c3185dab1b094f28bbb3d"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.939+15f52af?edgedb.nightly",
        using: :nounzip
      sha256 "67b94363c540ccdd41261e5826b768c277e9960f37027eafdb0a05212e419380"
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
