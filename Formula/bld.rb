class Bld < Formula
  desc "Open-source build tool for the RIFE2 Java web framework"
  homepage "https://rife2.com"
  url "https://repo.rife2.com/releases/com/uwyn/rife2/rife2/1.5.22/rife2-1.5.22-bld.zip"
  sha256 "3c7ce0cbc1ef5bde2a5af03be6c4763a552d1ffd05771965dc4705e09a2c124e"
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
