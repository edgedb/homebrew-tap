class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.0.0-dev.937"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.937+c6ee721?edgedb.nightly",
        using: :nounzip
      sha256 "a5d096f4d2d8fe25bb03442e01c3e03c38e582bb81b2b31469067a41033ca264"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.937+451510c?edgedb.nightly",
        using: :nounzip
      sha256 "8fd4e220f495aa5b529b1a6a71b74c00bf6a8ae992d6c60345cf394b0b4f372b"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.937+e3fa667?edgedb.nightly",
        using: :nounzip
      sha256 "9677b2837e0c66f3d34ab95323e994fbcb05ec5390ee775c5130066ac8b590e9"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.937+c586ba5?edgedb.nightly",
        using: :nounzip
      sha256 "889b3502cd2d5473e5e2130f6b5baeded3753ae095c6c1466ad61e0a974a29df"
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
