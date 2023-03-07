class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.0.0-dev.923"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.923+3001c5d?edgedb.nightly",
        using: :nounzip
      sha256 "e33ab162c265379bb71cd35ff15fc65ebce6c4424bd7302a118add6bcd26a61d"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.923+4b7a0eb?edgedb.nightly",
        using: :nounzip
      sha256 "dabc5aae39b6203afe883ae2828afebd8ff9209c40078cfc3120d0067a77903d"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.923+1637d00?edgedb.nightly",
        using: :nounzip
      sha256 "9bb2d14382c95ccc57e951dfa93b9c204a0e132685f77abe52964ed5c59c2994"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.923+bb6f6d8?edgedb.nightly",
        using: :nounzip
      sha256 "39f91124d63e865dbe782e981062805540dccc560c31713f03077cde6cf4e3d6"
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
