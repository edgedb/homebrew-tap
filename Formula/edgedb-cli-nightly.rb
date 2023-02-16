class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.3.0-dev.912"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.3.0-dev.912+68581de?edgedb.nightly",
        using: :nounzip
      sha256 "86c3a67b8d8b1ce50b00e5b1f6e5dabe08b02e2187684f005774bf618517cae1"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.3.0-dev.912+c39dc49?edgedb.nightly",
        using: :nounzip
      sha256 "a9f9588579e4661ab283cb1c68ab07e6236fd1a83edfa466da23a68568cbcffd"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.3.0-dev.912+b2d8d14?edgedb.nightly",
        using: :nounzip
      sha256 "a7e9049a7e58d8d1631fac0909295a797ffd717c67e3a5427544cb9ec3f5d9db"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-2.3.0-dev.912+678682c?edgedb.nightly",
        using: :nounzip
      sha256 "21eb8536a3805c6e56803712a30ac4a4e07c6ca0e5380baf3fb01893a8df04c3"
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
