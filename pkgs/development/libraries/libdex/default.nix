{ stdenv
, lib
, fetchFromGitLab
, gobject-introspection
, meson
, ninja
, pkg-config
, vala
, glib
, liburing
, gitUpdater
}:

stdenv.mkDerivation rec {
  pname = "libdex";
  version = "0.1.0";

  outputs = [ "out" "dev" ];

  src = fetchFromGitLab {
    domain = "gitlab.gnome.org";
    owner = "GNOME";
    repo = "libdex";
    rev = version;
    sha256 = "1SluktcmEf1CirYronhan8xmgY227hfnKE4VTPa9ICw=";
  };

  nativeBuildInputs = [
    gobject-introspection
    meson
    ninja
    pkg-config
    vala
  ];

  buildInputs = [
    glib
    liburing
  ];

  doCheck = true;

  passthru.updateScript = gitUpdater { };

  meta = with lib; {
    description = "Library supporting deferred execution for GNOME and GTK";
    homepage = "https://gitlab.gnome.org/GNOME/libdex";
    maintainers = teams.gnome.members;
    platforms = platforms.linux;
    license = licenses.lgpl21Plus;
  };
}
