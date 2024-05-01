class Bld < Formula
  desc "Pure java build tool for developers who don't like dealing with build tools"
  homepage "https://rife2.com/bld"
  url "https://repo1.maven.org/maven2/com/uwyn/rife2/bld/1.9.1/bld-1.9.1.zip"
  sha256 "2425e668697c10547362b971199eaf38b9dadbe072b2cba27a02b90e10a8b7e5"
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
