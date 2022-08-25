class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.1.0-dev.840"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.840+e094fd0?edgedb.nightly",
        using: :nounzip
      sha256 "ab8531e7c2c2f6537d816b01178f155db48d91eb4f01ab32fe42129669148d05"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.840+e094fd0?edgedb.nightly",
        using: :nounzip
      sha256 "e189aee38efb8aa39ea2ec8a7c8426c68ced4dc7459f0e3647e07bc22e789166"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.840+ed916a7?edgedb.nightly",
        using: :nounzip
      sha256 "7d76725e46b339ae467cffa97801186dea3afb03a9e1033cff72d9379215f12f"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.840+3bdc1f5?edgedb.nightly",
        using: :nounzip
      sha256 "71b1c6177281338fc37fec2d326487d7405fe9fe5394fd3f4afe35fa80111aef"
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
