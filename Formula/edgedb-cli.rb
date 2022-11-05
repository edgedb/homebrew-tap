class EdgedbCli < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.1.0"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin/edgedb-cli-2.1.0+527e309?edgedb.release",
        using: :nounzip
      sha256 "34d882570953bed13c0bb40a7b1b9e8990c4d6e26b563ec209ef5f9cf4339f0d"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin/edgedb-cli-2.1.0+527e309?edgedb.release",
        using: :nounzip
      sha256 "4edf1a99c65f64b88d6e11db90cc3391ef16e1dc40a3487f3e6e18773df94a98"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl/edgedb-cli-2.1.0+9678ffe?edgedb.release",
        using: :nounzip
      sha256 "4373e10908de6cf586a53dd811213fb4ccc07d074b9d9f17122281dcc6ddec5d"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl/edgedb-cli-2.1.0+e136de4?edgedb.release",
        using: :nounzip
      sha256 "80806410164690678f31d0e66a864353896e5201dbea10c4ceaba0a90c8b85b4"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  def install
    bin.install "edgedb.release" => "edgedb"
  end

  test do
    system "#{bin}/edgedb", "--version"
  end
end
