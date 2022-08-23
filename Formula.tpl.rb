{% set binary = "edgedb" + ("-{}".format(channel) if channel != "release" else "") -%}

class EdgedbCli{{ channel.capitalize() if channel != "release" }} < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "{{ version }}"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "{{ artifacts['aarch64-apple-darwin']['url'] }}?edgedb.{{ channel }}",
        using: :nounzip
      sha256 "{{ artifacts['aarch64-apple-darwin']['sha256'] }}"
    elsif Hardware::CPU.intel?
      url "{{ artifacts['x86_64-apple-darwin']['url'] }}?edgedb.{{ channel }}",
        using: :nounzip
      sha256 "{{ artifacts['x86_64-apple-darwin']['sha256'] }}"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "{{ artifacts["aarch64-unknown-linux-musl"]["url"] }}?edgedb.{{ channel }}",
        using: :nounzip
      sha256 "{{ artifacts["aarch64-unknown-linux-musl"]["sha256"] }}"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "{{ artifacts["x86_64-unknown-linux-musl"]["url"] }}?edgedb.{{ channel }}",
        using: :nounzip
      sha256 "{{ artifacts["x86_64-unknown-linux-musl"]["sha256"] }}"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  def install
    bin.install "edgedb.{{ channel }}" => "{{ binary }}"
  end

  test do
    system "#{bin}/{{ binary }}", "--version"
  end
end
