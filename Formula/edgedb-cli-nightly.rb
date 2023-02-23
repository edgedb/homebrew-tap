class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.0.0-dev.914"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.914+d3a9daf?edgedb.nightly",
        using: :nounzip
      sha256 "35b04e289cc5e21e5e0c7d0207eda6ded192b425e67009183012ddf52c36d920"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.914+6102f26?edgedb.nightly",
        using: :nounzip
      sha256 "65d3672af1a008aafe5c52cae49e7fc14580d6f8a87a030bffdb26470ccd5d52"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.914+ff17c8d?edgedb.nightly",
        using: :nounzip
      sha256 "6712ec451d2979a94d4989b7fa150e6204e1c80fa76c4d59c4547115879ecc1f"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.914+368bed5?edgedb.nightly",
        using: :nounzip
      sha256 "99b005cc4ebc652a7c415388eb0a9a9352c72314fe2cdf804ca5e628b45da163"
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
