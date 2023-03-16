class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.0.0-dev.939"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.939+368d4ac?edgedb.nightly",
        using: :nounzip
      sha256 "45da9686a92dfb3a529b1a94c4fb681d103bd4a721bf4c793b947a5efcf98297"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.939+73505bf?edgedb.nightly",
        using: :nounzip
      sha256 "15eb0baa533923060879cb9366ee20983f8c7637a8ebf98d8ec0caee6ad60f6e"
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
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.939+70aab2d?edgedb.nightly",
        using: :nounzip
      sha256 "e308efea52e7e33a40373906cb08d442f80a5946535f9af86666968042415df0"
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
