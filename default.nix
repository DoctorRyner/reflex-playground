(import ./reflex-platform {
  config.android_sdk.accept_license = true;
}).project ({ pkgs, ... }: {
  # useWarp = true;

  packages = {
    common = ./common;
    backend = ./backend;
    frontend = ./frontend;
  };
  
  shells = {
    ghc = ["common" "backend" "frontend"];
    ghcjs = ["common" "frontend"];
    iosAarch64 = ["common" "frontend"];
  };

  android.frontend = {
    executableName = "frontend";
    applicationId = "org.example.frontend";
    displayName = "Example Android App";
  };

  ios.frontend = {
    executableName = "frontend";
    bundleIdentifier = "org.example.frontend";
    bundleName = "HelloReflex";
  };
})
