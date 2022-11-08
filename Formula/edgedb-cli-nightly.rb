class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.2.0-dev.868"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.2.0-dev.868+195fd77?edgedb.nightly",
        using: :nounzip
      sha256 "642e00fd885e27f3327264422c6dcd67d2bb9c0cae403c348fd95f9d56ac0a99"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.2.0-dev.868+73e2fee?edgedb.nightly",
        using: :nounzip
      sha256 "89b7585c3b0cf3107000beef76a1415b7d9499f9ca700cf584c0fdc51c54ad2f"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.2.0-dev.868+39db82f?edgedb.nightly",
        using: :nounzip
      sha256 "ee0aba2d1192413b1bb838a2a73f5715f168b36f8cd04f00e68899be9bb94acf"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-2.2.0-dev.868+fc9f7ca?edgedb.nightly",
        using: :nounzip
      sha256 "01b411a4be44358a3691f34c79936f5525e417e95f5d7e53eac22bc8beabf1e5"
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
