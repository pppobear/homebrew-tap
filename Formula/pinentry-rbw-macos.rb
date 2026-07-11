class PinentryRbwMacos < Formula
  desc "macOS pinentry for rbw with Touch ID or Apple Watch authentication"
  homepage "https://github.com/pppobear/pinentry-rbw-macos"
  version "0.2.3"

  on_arm do
    url "https://github.com/pppobear/pinentry-rbw-macos/releases/download/v0.2.3/pinentry-rbw-macos-v0.2.3-macos-arm64.zip"
    sha256 "5b2d9d9a6a32d49bc7686168ae4950792d733414f9e94c3eeab6e165e2892dab"
  end

  on_intel do
    url "https://github.com/pppobear/pinentry-rbw-macos/releases/download/v0.2.3/pinentry-rbw-macos-v0.2.3-macos-x86_64.zip"
    sha256 "12f2ee0156e8dbb74255cc2a8473f05a8bde2adc92d90570f8a5beb8981897f9"
  end

  depends_on macos: :ventura

  def install
    bin.install "pinentry-rbw-macos"
    zsh_completion.install "completions/_pinentry-rbw-macos"
    fish_completion.install "completions/pinentry-rbw-macos.fish"
  end

  test do
    output = pipe_output("#{bin}/pinentry-rbw-macos", "GETINFO version\nBYE\n")
    assert_match "D #{version}", output
  end
end
