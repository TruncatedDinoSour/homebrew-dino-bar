class Arigram < Formula
  include Language::Python::Virtualenv

  desc "Terminal telegram client"
  homepage "https://github.com/TruncatedDinosour/arigram"
  url "https://github.com/TruncatedDinosour/arigram/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "2ba72ebc55b83a48633f10ad83f581bdf30c1e7f68f4342b4fd000da5cb95d2a"
  license "Unlicense"

  depends_on "python@3.9"
  depends_on "tdlib"

  resource "python-telegram-patched" do
    url "https://github.com/paul-nameless/python-telegram/archive/refs/tags/0.14.0-patched.tar.gz"
    sha256 "7f3af4cb722f37bd65b0a49da448b7d26afa7f2de761aed4828018155e2e78b4"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    require "pty"

    PTY.spawn(bin/"tg") do |r, w, _pid|
      assert_match "Enter your phone", r.gets
      w.close
      r.close
    end
  end
end
