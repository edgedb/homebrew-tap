class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.0.0-dev.942"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.942+36e99ad?edgedb.nightly",
        using: :nounzip
      sha256 "93756a95c80f25a607f161988249b864b315f6d0e93ce9f4b751fc91d8cde89c"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.942+52199ed?edgedb.nightly",
        using: :nounzip
      sha256 "926cdcb875415caccf1a6c6902e875bda8432b3bd1f38ed9294c4f8a56198c6d"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.942+1b9069e?edgedb.nightly",
        using: :nounzip
      sha256 "ebf5efdf8d2445d36785892075072fa10bf237a3a21af2902be72aa883dd20e6"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.942+6192f6c?edgedb.nightly",
        using: :nounzip
      sha256 "0303b67496b8a665e2d48cbbc01be110d1122420dd37e8f848af8296250be51e"
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
