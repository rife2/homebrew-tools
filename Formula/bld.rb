class Bld < Formula
  desc "Pure java build tool for developers who don't like dealing with build tools"
  homepage "https://rife2.com/bld"
  url "https://repo1.maven.org/maven2/com/uwyn/rife2/bld/1.7.4/bld-1.7.4.zip"
  sha256 "f4fddcf80f5d7ca5a418a8110d6b208530ea25fcff09eeb9bb2f829ea843fbd4"
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
