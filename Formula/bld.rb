class Bld < Formula
  desc "Pure java build tool for developers who don't like dealing with build tools"
  homepage "https://rife2.com/bld"
  url "https://repo1.maven.org/maven2/com/uwyn/rife2/bld/2.2.1/bld-2.2.1.zip"
  sha256 "2e8421244a2f1849c9ea43e15ebbd153cce98998e705143d8c9610893c1b41b7"
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
