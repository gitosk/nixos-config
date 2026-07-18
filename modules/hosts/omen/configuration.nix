{ self, inputs, ... }: {

  flake.nixosConfigurations.omen = inputs.nixpkgs.lib.nixosSystem {
    modules = [   
    # import system-level modules       
    self.nixosModules.omenModule
    self.nixosModules.myHomeManager
    ];

  };


  flake.nixosModules.omenModule = { pkgs, ...}: {
    # Do the configuration in a module named omenModule
    
    imports = [
          self.nixosModules.omenHardware              
          self.nixosModules.omenNvidia
          self.nixosModules.hyprland
#         self.nixosModules.niri              
          self.nixosModules.gaming
          self.nixosModules.nvf
          self.nixosModules.noctalia
    ];


    nix.settings.experimental-features = [ "nix-command" "flakes" ];


    home-manager.users.osk = self.homeModules.oskDefault;


    users.users.osk = {
      isNormalUser = true;
      extraGroups = [ "networkmanager" "wheel" ];

    };


 
    services.flatpak.enable = true;  # For flatpak aplications
    programs.firefox.enable = true;


        # ---------------- Virtualisation -------------
    virtualisation = {
      waydroid.enable = true; # Android Apps, not working currently
#      podman = {              # For dockers and distrobox
#      enable = true;
#      dockerCompat = true;
#     };
    };
    
    # Enable the KDE Plasma Desktop Environment and related Apps.
    services.displayManager = {
      sddm = {
        enable = true; # enabled in configuration.nix
        wayland.enable = true;
        settings = {
          General.DisplayServer = "wayland";
        };
      };
    };

    services.desktopManager.plasma6.enable = true;
    programs.kdeconnect.enable = true;

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;


    # Optional, hint Electron apps to use Wayland:
    environment.sessionVariables.NIXOS_OZONE_WL = "1";
          

    # Use latest kernel.
    boot.kernelPackages = pkgs.linuxPackages_latest;


    networking.hostName = "omen"; # Define your hostname.
  #  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Enable networking - disabling this fucks up wifi. The nftables is a requisite for waydroid.
    networking.networkmanager.enable = true;
    networking.nftables.enable = true; 

    # Set your time zone.
    time.timeZone = "Europe/Berlin";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";

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

    # Enable the X11 windowing system.
    # You can disable this if you're only using the Wayland session.
    # services.xserver.enable = true;



    # Configure keymap in X11
    # services.xserver.xkb = {
    #   layout = "de";
    #   variant = "";
    # };

    # Configure console keymap
    console.keyMap = "de";

    # Enable CUPS to print documents.
    services.printing.enable = true;

    # Enable sound with pipewire.
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;
    };


    # Enable Bluethooth
    
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = false;
      settings = {
        General = {
          Experimental = true;  # Shows Battery charge on supported Bluethooth adapters
        };  
      };
    };




      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    

    # Enable touchpad support (enabled default in most desktopManager).
    # services.xserver.libinput.enable = true;

    # Define a user account. Don't forget to set a password with ‘passwd’.


    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
       neovim			# editor 
       wget			# forgot :P
       git			# git
       unzip			# Unzip
       yazi                     # File manager, best app ever.
       vlc
       scarlett2                # For audio card recording
       alsa-scarlett-gui
       distrobox
    ];
    

    fonts.packages = with pkgs; [
      noto-fonts
      nerd-fonts.symbols-only
      nerd-fonts.jetbrains-mono
      liberation_ttf
    ];

    # List services that you want to enable:

    # Enable the OpenSSH daemon.
    # services.openssh.enable = true;

    # Open ports in the firewall.
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    # networking.firewall.enable = false;

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "25.05"; # Did you read the comment?
    
  };
}
