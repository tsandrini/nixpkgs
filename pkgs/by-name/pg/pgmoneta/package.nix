{ lib
, stdenv
, bzip2
, cjson
, cmake
, curl
, docutils
, fetchFromGitHub
, libarchive
, libev
, libgccjit
, libssh
, lz4
, openssl
, systemd
, zlib
, zstd
}:

stdenv.mkDerivation rec {
  pname = "pgmoneta";
  version = "0.13.0";

  src = fetchFromGitHub {
    owner = "pgmoneta";
    repo = "pgmoneta";
    rev = version;
    hash = "sha256-HDFvU7TjOENFvBorn11ludy8QQb4/IC6hEyyzvrJ2lU=";
  };

  nativeBuildInputs = [
    cmake
    docutils # for rst2man
  ];

  buildInputs = [
    bzip2
    cjson
    curl
    libarchive
    libev
    libgccjit
    libssh
    lz4
    openssl
    systemd
    zlib
    zstd
  ];

  env.NIX_CFLAGS_COMPILE = "-Wno-error";

  meta = with lib; {
    description = "Backup / restore solution for PostgreSQL";
    homepage = "https://pgmoneta.github.io/";
    changelog = "https://github.com/pgmoneta/pgmoneta/releases/tag/${version}";
    license = licenses.bsd3;
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
