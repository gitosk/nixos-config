{ self, inputs, ... }: {

  imports = [
    # Here are the top level flake modules inported
    inputs.home-manager.flakeModules.home-manager
  ];
  
 
  config.systems = [ 
    # Here imput the supported systems architechtures.
    "x86_64-linux"
  ];

}
