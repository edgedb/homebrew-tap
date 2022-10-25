class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.1.0-dev.859"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.859+288f28f?edgedb.nightly",
        using: :nounzip
      sha256 "52389157e394dc9674948e1b9a758acf91e5a0b509f3598b7dc05a08b94b18a1"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.859+288f28f?edgedb.nightly",
        using: :nounzip
      sha256 "97d74ee3379b6d7ef08ee8ba47bd29437a6f4c9815e822cd6e80d7c2e59f9731"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.859+6736880?edgedb.nightly",
        using: :nounzip
      sha256 "73b1f0b6d77fc2fb82d0aded9e43a61a190c2e92f07951df6b8da812289d0eae"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.859+841b2b8?edgedb.nightly",
        using: :nounzip
      sha256 "746770ef8afb8f9f0e251d148253f786877e9588d63c6dcbb3d241a592936954"
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
