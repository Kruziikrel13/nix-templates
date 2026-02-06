{
  lib,
  rustPlatform,
  pkg-config,
}:
rustPlatform.buildRustPackage {
  pname = "package";
  version = "0";

  src = ../.;

  nativeBuildInputs = [ pkg-config ];
  cargoHash = lib.fakeHash;

  meta = with lib; {
    homepage = "";
    description = "";
    mainProgram = "";
    license = licenses.mit;
    platforms = platforms.linux;
    maintainers = [ maintainers.kruziikrel13 ];
  };
}
