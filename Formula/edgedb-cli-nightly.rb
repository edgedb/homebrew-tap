class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.1.0-dev.841"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.841+5deca1d?edgedb.nightly",
        using: :nounzip
      sha256 "13352b846c4aff42b6acef1ba67158cf009928a6e320f29406401e6156838a79"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.841+5deca1d?edgedb.nightly",
        using: :nounzip
      sha256 "97fdd01e675713baccaa52e7808af5b78e72091f8355af2fa7265fdadbb85a57"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.841+996a5d1?edgedb.nightly",
        using: :nounzip
      sha256 "98395cbfd68240f47fccaabc08d5b96c95472f2c5562110f3031ecc712fdd0f1"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.841+66f5fdd?edgedb.nightly",
        using: :nounzip
      sha256 "195b0186c7a11ad37ac7e612b0a925ca87d745db9193372a85726c08bf558eb4"
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
