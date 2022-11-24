class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.3.0-dev.888"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.3.0-dev.888+085e19c?edgedb.nightly",
        using: :nounzip
      sha256 "291d6d5ad6f8d103f42c21611627e08ebb18ff75e9be02c94b794db76985e416"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.3.0-dev.888+085e19c?edgedb.nightly",
        using: :nounzip
      sha256 "5df820b5bef273fea01ac0d328731fb538a751fa272efe0c12849cd4ad96a103"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.3.0-dev.888+1e7e257?edgedb.nightly",
        using: :nounzip
      sha256 "6be9e32f53d357e34bf316b0e122eab842e1a2bda05e1d163adc3807741ce662"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-2.3.0-dev.888+06d0ffa?edgedb.nightly",
        using: :nounzip
      sha256 "fc9acbd312fce36b33d2cfe90ab3167c7fc4e8e4fd4a31ef0caafa1e3aacbc3d"
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
