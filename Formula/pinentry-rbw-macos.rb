class PinentryRbwMacos < Formula
  desc "macOS pinentry for rbw with Touch ID or Apple Watch authentication"
  homepage "https://github.com/pppobear/pinentry-rbw-macos"
  version "0.2.2"

  on_arm do
    url "https://github.com/pppobear/pinentry-rbw-macos/releases/download/v0.2.2/pinentry-rbw-macos-v0.2.2-macos-arm64.zip"
    sha256 "7567c35ff8e44be085402ba11a686c64016fc9f1b2dc53b26d71bc7bbb82bfc7"
  end

  on_intel do
    url "https://github.com/pppobear/pinentry-rbw-macos/releases/download/v0.2.2/pinentry-rbw-macos-v0.2.2-macos-x86_64.zip"
    sha256 "08e6fcb8e769e6381d708ea0e855a8d1866f23be21a250249f6998fc27fd036c"
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
