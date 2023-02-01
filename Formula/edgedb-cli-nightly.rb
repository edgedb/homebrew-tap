class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.3.0-dev.907"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.3.0-dev.907+65102d6?edgedb.nightly",
        using: :nounzip
      sha256 "73d7c9cccbcb842e327b015b24c455e94a7989c863588213c3a0f5af4460f9e8"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.3.0-dev.907+10ef486?edgedb.nightly",
        using: :nounzip
      sha256 "673f2597709e3c6264ae06564c32659d8c0cc85c626680abf93a90a1da1a1148"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.3.0-dev.907+247452f?edgedb.nightly",
        using: :nounzip
      sha256 "06a1aee2b435e9ce59b64d4956d6a37ba0e876487774ad1809dde6674c078ff8"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-2.3.0-dev.907+19ffdb5?edgedb.nightly",
        using: :nounzip
      sha256 "397370549fd72f692c1ed0b95be4f6063938ed6621d63a613d9096720381069d"
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
