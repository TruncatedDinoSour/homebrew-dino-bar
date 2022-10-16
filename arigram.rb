class Arigram < Formula
  include Language::Python::Virtualenv

  desc "A fork of tg -- a hackable telegram TUI client"
  homepage "https://github.com/TruncatedDinosour/arigram"
  url "https://github.com/TruncatedDinosour/arigram/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "101a89fd7c1f1343052a9f138670acc4dd57f070440258aaaac2d37d85435f75"
  license "Unlicense"

  depends_on "python@3.9"
  depends_on "tdlib"

  resource "python-telegram-patched" do
    url "https://github.com/TruncatedDinosour/python-telegram/archive/refs/tags/0.15.0-patched.tar.gz"
    sha256 "be66bd1c70018d6f0dacd33e027e8b80ff96ca50cabca410ea1946bd82cc78f7"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    require "pty"

    PTY.spawn(bin/"arigram") do |r, w, _pid|
      assert_match "Enter your phone", r.gets
      w.close
      r.close
    end
  end
end
