{config, lib, ...}:

{
  # Enable OpenGL
  hardware.graphics = {
    enable = true;
  };

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = [ "amdgpu" "nvidia" ];
  
   #boot.kernelParams = [ "button.lid_init_state=open" ];
  
  services.logind.settings.Login.HandleLidSwitchExternalPower = "ignore";
  services.logind.settings.Login.HangleLidSwitchDocked = "ignore";

  environment.variables = rec {
        LIBVA_DRIVER_NAME = "nvidia";
        __GLX_VENDOR_LIBRARY_NAME = "nvidia";
        };

  hardware.nvidia = {

    # Modesetting is required.
    modesetting.enable = true;

    
    powerManagement.enable = true;

    powerManagement.finegrained = false;

     
    # Only available from driver 515.43.04+
    open = true;

    # Enable the Nvidia settings menu,
	# accessible via `nvidia-settings`.
    nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    # package = config.boot.kernelPackages.nvidiaPackages.beta;
  };

    


    # Enabling Optimus PRIME Sync mode as default

    hardware.nvidia.prime = {
    # Make sure to use the correct Bus ID values for your system!
      sync.enable = true;
      amdgpuBusId = "PCI:7:0:0"; 
      nvidiaBusId = "PCI:1:0:0"; 
        };
        
        
  # Boot Option für unterwegs

    specialisation = {  
      on-the-go.configuration = {
        system.nixos.tags = ["on-the-go"];            
        hardware.nvidia.prime = {
          offload = {
            enable = true;
            enableOffloadCmd = true;
          };
          sync.enable = lib.mkForce false;
      };
    };
  };
}
