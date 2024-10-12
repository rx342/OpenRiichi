{
  stdenv,
  vala,
  meson,
  cmake,
  pkg-config,
  glib,
  libgee,
  gtk3,
  glew,
  SDL2_image,
  SDL2_mixer,
  ninja,
  git,
}:

stdenv.mkDerivation {
  name = "OpenRiichi";
  src = ./.;
  nativeBuildInputs = [
    vala
    meson
    cmake
    pkg-config
    ninja
    git
  ];
  buildInputs = [
    glib
    libgee
    gtk3
    glew
    SDL2_image
    SDL2_mixer
  ];
  buildPhase = ''
    mkdir -p $out
    meson setup build $src -Dbuildtype=release --prefix=$out
    ninja -C build
  '';
  installPhase = ''
    ninja -C build install
    mkdir -p $out/bin
    mv build/OpenRiichi $out/bin
  '';
}
