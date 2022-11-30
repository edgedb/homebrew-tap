class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.3.0-dev.892"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.3.0-dev.892+7e3af4d?edgedb.nightly",
        using: :nounzip
      sha256 "ea083cb2c78a1fffac8d4978f8a95983fd32821341a72aa189805ab4a99a63e1"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.3.0-dev.892+5920a39?edgedb.nightly",
        using: :nounzip
      sha256 "92138f41047c45cd32d6b7abc6e31a3a38db04b2f57e781f1c670a82a6114d72"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.3.0-dev.892+630740e?edgedb.nightly",
        using: :nounzip
      sha256 "98ffdee3a47397551d0252591011a19bd229783b4b6ad7b1867d81064064fcfa"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-2.3.0-dev.892+a0a9e0c?edgedb.nightly",
        using: :nounzip
      sha256 "546768deafe97b0c6b691f5c735b332761aab5fd0a35949aee2c359742c4bc0d"
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
