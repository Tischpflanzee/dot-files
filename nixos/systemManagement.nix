{config, pkgs, ...}:

{

  services.xserver.xkb = {
    layout = "de";
    variant = "";
  };

  boot.loader = {
    grub = {
      enable = true;
      device = "nodev"; # "nodev" is used for UEFI
      efiSupport = true;
      };
    efi.canTouchEfiVariables = true;
  };


boot.loader.grub.theme = pkgs.stdenv.mkDerivation {
  pname = "GRUB-Theme-CRT-TV";
  version = "7a95026c160bb5387e6973dd53d89378743bacd6";
  src = pkgs.fetchFromGitHub {
    owner = "bulat-chu";
    repo = "GRUB-Theme-CRT-TV";
    rev = "7a95026c160bb5387e6973dd53d89378743bacd6";
    hash = "sha256-RJcn/AH1A4AoW6rnKT4ijEO9UIQRQZZHINpBafEOgZ4=";
    };
    installPhase = "cp -r 1920x1080/CRT-TV  $out";
};

  # Bootloader.
  #boot.loader.systemd-boot.enable = true;
  #boot.loader.efi.canTouchEfiVariables = true;

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        # Shows battery charge of connected devices on supported
        # Bluetooth adapters. Defaults to 'false'.
        Experimental = true;
        # When enabled other devices can connect faster to us, however
        # the tradeoff is increased power consumption. Defaults to
        # 'false'.
        FastConnectable = true;
      };
      Policy = {
        # Enable all controllers when they are found. This includes
        # adapters present on start as well as adapters that are plugged
        # in later on. Defaults to 'true'.
        AutoEnable = true;
      };
    };
  };

  # Time Zone 
  time.timeZone = "Europe/Berlin";

  
  # Select internationalisation properties.
  i18n.defaultLocale = "de_DE.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  #Configure console keymap
  console.keyMap = "de";

   #Enable touchpad support (enabled default in most desktopManager).
   services.xserver.libinput.enable = true;

}
