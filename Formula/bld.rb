class Bld < Formula
  desc "Open-source build tool for the RIFE2 Java web framework"
  homepage "https://rife2.com"
  url "https://repo.rife2.com/releases/com/uwyn/rife2/rife2/1.6.0/rife2-1.6.0-bld.zip"
  sha256 "57d59eea28248fa4aacc9328fb1f2ed36bc05ce8da20578f938d42767d0334d1"
  license "Apache-2.0"

  depends_on "openjdk"

  def install
    rm_f Dir["bin/*.bat"]
    libexec.install %w[bin lib]
    env = Language::Java.overridable_java_home_env("17")
    (bin/"bld").write_env_script libexec/"bin/bld", env
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bld help")
  end
end
