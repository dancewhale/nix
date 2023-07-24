{ pkgs, ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.whale = {
    isNormalUser = true;
    home = "/home/whale";
    description = "whale user";
    extraGroups = [ "docker" "wheel" "networkmanager" ];
    shell = pkgs.fish;
    hashedPassword = "$y$j9T$xUI7hlNw3YY3LWvpHlHe3.$D4hHAOvfziW3bAipJLOzAkWunUI.Ydr.zIGIeYwnxw5";
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC24xA8nfgeMVfbpELpYU8IVNZAeIwmk5zeYmXIsaSYjK4lxG/SpfdApTY1a2QHNEP4x4JvwQXOsHs4oQ+yrpRXO8F4b/LjqwaLcReUC8AsAMQ7KzW6Hes7kIXsKaQbbUaYJSekaN1O2cC5/7RpvCnmsF1kyeuUDL3frYW5Fx/s7kC/o9dTFxwW+czrixPmJK79YxiY0DE4YmkZnnxi2zQYzxzBJNNpB+I9JySaNtkaZW7zFRWdEQIwfkxSmpJiJGQFEJamQ2tPBIisKWKdblanJ5HcmIlGdF4MuvE9H21AdUdJe/oXJSN4ibUjwiyH1i4BYVxm0QXJD8D5b3O/FkIt whale@dancewhaledeMacBook-Pro.local"
    ];
  };

  users.users."root".openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC24xA8nfgeMVfbpELpYU8IVNZAeIwmk5zeYmXIsaSYjK4lxG/SpfdApTY1a2QHNEP4x4JvwQXOsHs4oQ+yrpRXO8F4b/LjqwaLcReUC8AsAMQ7KzW6Hes7kIXsKaQbbUaYJSekaN1O2cC5/7RpvCnmsF1kyeuUDL3frYW5Fx/s7kC/o9dTFxwW+czrixPmJK79YxiY0DE4YmkZnnxi2zQYzxzBJNNpB+I9JySaNtkaZW7zFRWdEQIwfkxSmpJiJGQFEJamQ2tPBIisKWKdblanJ5HcmIlGdF4MuvE9H21AdUdJe/oXJSN4ibUjwiyH1i4BYVxm0QXJD8D5b3O/FkIt whale@dancewhaledeMacBook-Pro.local"
  ];

}
