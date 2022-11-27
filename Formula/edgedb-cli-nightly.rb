class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.3.0-dev.890"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.3.0-dev.890+8f1288f?edgedb.nightly",
        using: :nounzip
      sha256 "62398b7b850eb46e4a2b539fb85ad81ffe4c3b449243ebb118898879219b4a0c"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.3.0-dev.890+246b0cd?edgedb.nightly",
        using: :nounzip
      sha256 "2e57c929f8a8769f15eb90f658ace38f023617644776db8ae0ebec5fdae5490f"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.3.0-dev.890+b77619b?edgedb.nightly",
        using: :nounzip
      sha256 "a3e21f5664a14fddda268bcb5398fcf87809c4a14dc426eb132e24eccb60f70d"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-2.3.0-dev.890+4d4ca0d?edgedb.nightly",
        using: :nounzip
      sha256 "1fe1ac4f8284060c42611e442834ffdb7049a1cd0a5379ee302d4ef9ea0a5b9f"
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
