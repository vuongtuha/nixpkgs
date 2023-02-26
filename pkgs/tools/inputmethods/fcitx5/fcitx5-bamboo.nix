{ lib
, stdenv
, fetchFromGitHub
, cmake
, extra-cmake-modules
, go
, glib
, hicolor-icon-theme
, fcitx5
, fcitx5-qt
, gettext
, wrapQtAppsHook
}:

stdenv.mkDerivation rec {
  pname = "fcitx5-bamboo";
  version = "1.0.2";

  src = fetchFromGitHub {
    owner = "fcitx";
    repo = "fcitx5-bamboo";
    rev = version;
    sha256 = "sha256-LaCDDwM5idq4JEs5F0ysMZfWIEaRqMBNgIyNf9DhmhY=";
  };

  nativeBuildInputs = [ cmake extra-cmake-modules go wrapQtAppsHook ];

  buildInputs = [ fcitx5 fcitx5-qt gettext ];

  meta = with lib; {
    description = "Typing Vietnamese on Fcitx5 by Bamboo engine";
    homepage = "https://github.com/fcitx/fcitx5-bamboo";
    license = with licenses; [ gpl2Plus lgpl21Plus ];
    maintainers = with maintainers; [ vuongtuha ];
    platforms = platforms.linux;
  };
}
