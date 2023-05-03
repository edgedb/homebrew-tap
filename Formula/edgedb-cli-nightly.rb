class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.0.0-dev.973"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.973+94a5933?edgedb.nightly",
        using: :nounzip
      sha256 "4d55eb5bd47b802277780e9e7fbe40d9c470148582bcbf3ceacebeba53d721e9"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.973+62a8976?edgedb.nightly",
        using: :nounzip
      sha256 "71a164a94af6c74b95268320d88aebf1c169d60c37ea50a7f4d66fa51d98ce3a"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.973+eaac214?edgedb.nightly",
        using: :nounzip
      sha256 "34da29cd7297c35a5e71b6d6ad3005a9d5ef0f53c894776777fb0de8a1f459ba"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.973+ba91f6c?edgedb.nightly",
        using: :nounzip
      sha256 "7ceca4fca51ffdbff0597d793a39d634e06fcf957181ede93c93de58a0a46e5d"
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
