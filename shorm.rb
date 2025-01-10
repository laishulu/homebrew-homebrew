class Shorm < Formula
  desc "SSH Connection Manager"
  homepage "https://github.com/laishulu/shorm"
  version "1.2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/laishulu/shorm/releases/download/v#{version}/shorm-macos-arm64"
      sha256 "11221ffb94d00dc5930a249e96a1319fce24a825c43b408e85709390336cf529"
    else
      url "https://github.com/laishulu/shorm/releases/download/v#{version}/shorm-macos-x86_64"
      sha256 "dcde94d8cf9232fa3d9e0dc24c640bcb6317e4d3ed960994cadf077ad9288959"
    end
  elsif OS.linux?
    url "https://github.com/laishulu/shorm/releases/download/v#{version}/shorm-linux-x86_64"
    sha256 "5f8a4db3bf4168b929ec928781b6562c6913034ccaebe1d90e8bc7d141c24611"
  end

  def install
    bin.install "shorm-macos-arm64" => "shorm" if OS.mac? && Hardware::CPU.arm?
    bin.install "shorm-macos-x86_64" => "shorm" if OS.mac? && !Hardware::CPU.arm?
    bin.install "shorm-linux-x86_64" => "shorm" if OS.linux?
  end

  test do
    system "#{bin}/shorm", "--version"
  end
end
