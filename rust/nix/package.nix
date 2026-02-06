{
  lib,
  rustPlatform,

  pkg-config,
}:
rustPlatform.buildRustPackage (finalAttrs: {
  pname = "rust-package";
  version = "0";
  src = ../.;
  cargoHash = lib.fakeHash;

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ ];

  meta = with lib; {
    homepage = "";
    description = "";
    mainProgram = "";
    license = licenses.mit;
    maintainers = [ maintainers.kruziikrel13 ];
  };
})
