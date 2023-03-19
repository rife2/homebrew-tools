class Rife2Bld < Formula
  desc "Open-source build tool for the RIFE2 Java web framework"
  homepage "https://rife2.com"
  url "https://repo1.maven.org/maven2/com/uwyn/rife2/rife2/1.5.0/rife2-1.5.0-bld.zip"
  sha256 "8b5aa0dd6a3f72dd80e25ee31fb76f53325e15a685aa16ab0eed8c0b70a9e777"
  license "Apache-2.0"

  depends_on "openjdk"

  def install
    rm_f Dir["bin/*.bat"]
    libexec.install %w[bin lib]
    env = Language::Java.overridable_java_home_env("19")
    (bin/"rife2-bld").write_env_script libexec/"bin/rife2-bld", env
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rife2-bld help")
  end
end
