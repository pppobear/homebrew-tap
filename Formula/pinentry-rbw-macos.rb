class PinentryRbwMacos < Formula
  desc "macOS pinentry for rbw with Touch ID or Apple Watch authentication"
  homepage "https://github.com/pppobear/pinentry-rbw-macos"
  url "https://github.com/pppobear/pinentry-rbw-macos/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "697a282e3b2db06e6ddb01be10c7398346db660ee27e27d8c8896c9bd37fa28a"
  head "https://github.com/pppobear/pinentry-rbw-macos.git", branch: "main"

  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/pinentry-rbw-macos"
  end

  test do
    assert_match "pinentry-rbw-macos", shell_output("#{bin}/pinentry-rbw-macos --help")
  end
end
