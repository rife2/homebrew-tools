class Bld < Formula
  desc "Pure java build tool for developers who don't like dealing with build tools"
  homepage "https://rife2.com/bld"
  url "https://repo1.maven.org/maven2/com/uwyn/rife2/bld/2.3.0/bld-2.3.0.zip"
  sha256 "946664ab711309a80cf8ff67ed5abff3239c09282891c2cea542a4414da7c587"
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
