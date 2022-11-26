class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.3.0-dev.890"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.3.0-dev.890+a280691?edgedb.nightly",
        using: :nounzip
      sha256 "cdb41510f40c2375f29498614b8df83082e713d8f170de43d876abbdd588159c"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.3.0-dev.890+a280691?edgedb.nightly",
        using: :nounzip
      sha256 "9c00c338618b0611c6fa7b315d1a632c6adf96d120f3b8751d0d878c3174f639"
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
