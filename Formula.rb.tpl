{% set binary = "edgedb" + ("-{}".format(channel) if channel != "release" else "") -%}

class EdgedbCli{{ channel.capitalize() if channel != "release" }} < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "{{ version }}"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "{{ artifacts['aarch64-apple-darwin']['url'] }}",
        using: :nounzip
      sha256 "{{ artifacts['aarch64-apple-darwin']['sha256'] }}"

      def install
        bin.install "{{ artifacts['aarch64-apple-darwin']['file']  }}" => "{{ binary }}"
      end
    elsif Hardware::CPU.intel?
      url "{{ artifacts['x86_64-apple-darwin']['url'] }}",
        using: :nounzip
      sha256 "{{ artifacts['x86_64-apple-darwin']['sha256'] }}"

      def install
        bin.install "{{ artifacts['x86_64-apple-darwin']['file']  }}" => "{{ binary }}"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "{{ artifacts["aarch64-unknown-linux-musl"]["url"] }}",
        using: :nounzip
      sha256 "{{ artifacts["aarch64-unknown-linux-musl"]["sha256"] }}"

      def install
        bin.install "{{ artifacts['aarch64-unknown-linux-musl']['file']  }}" => "{{ binary }}"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "{{ artifacts["x86_64-unknown-linux-musl"]["url"] }}",
        using: :nounzip
      sha256 "{{ artifacts["x86_64-unknown-linux-musl"]["sha256"] }}"

      def install
        bin.install "{{ artifacts['x86_64-unknown-linux-musl']['file']  }}" => "{{ binary }}"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/{{ binary }}", "--version"
  end
end
