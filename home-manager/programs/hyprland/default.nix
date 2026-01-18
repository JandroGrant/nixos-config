{
  wayland.windowManager.hyprland =
  let 
    terminal = "kitty";
    browser = "firefox";
    menu = ''rofi -show drun -p "Launch?"'';
    wallpaperSwitcher = "~/shellscripts/wallpaper-switcher.sh";
    notes = "~/shellscripts/notes.sh";

    mainMod = "SUPER";
    shiftMod = "SHIFT SUPER";
    printMod = "${mainMod}, P";
  in
  {
    enable = true;
    sourceFirst = true;
    settings = {
      source = "~/.cache/wal/colors-hyprland.conf";
      exec = [
        "swww-daemon & sleep 0.1 & swww img $wallpaper -f Lanczos3 --transition-fps 60 --transition-type center --trasnition-duraction 1"
      ];
      exec-once = [
        "sudo keyd"
        "waybar"
      ];
      monitor = ",preferred,auto,auto";

      # env variables
      env = [
        "XCURSOR_SIZE,24"
	"HYPRCURSOR_SIZE,24"
      ];

      general = {
        gaps_in = 5;
	gaps_out = 20;
	border_size = 2;
	"col.active_border" = "$color1";
	"col.inactive_border" = "$background";
	resize_on_border = false;
	allow_tearing = false;
	layout = "dwindle";
      };

      decoration = {
        rounding = 10;
	rounding_power = 2;

	active_opacity = 1;
	inactive_opacity = 0.95;

	shadow = {
          enabled = true;
	  range = 4;
	  render_power = 3;
	  color = "rgba(1a1aee)";
	};

	blur = {
          enabled = true;
	  size = 3;
	  passes = 1;

	  vibrancy = 0.1696;
	};
      };
      
      animations = {
        enabled = "yes, please :)";

	bezier = [
          "easeOutQuint, 0.23, 1, 0.32, 1"
	  "easeInOutCubic, 0.65, 0.05, 0.36, 1"
	  "linear, 0, 0, 1, 1"
	  "almostLinear, 0.5, 0.5, 0.75, 1"
	  "quick, 0.15, 0, 0.1, 1"
	];

	animation = [
           "global, 1, 10, default"
	   "border, 1, 5.39, easeOutQuint"
	   "windows, 1, 4.79, easeOutQuint"
	   "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
	   "windowsOut, 1, 1.49, linear, popin 87%"
	   "fadeIn, 1, 1.73, almostLinear"
	   "fadeOut, 1, 1.46, almostLinear"
	   "fade, 1, 3.03, quick"
	   "layers, 1, 3.81, easeOutQuint"
	   "layersIn, 1, 4, easeOutQuint, fade"
	   "layersOut, 1, 1.5, linear, fase"
	   "fadeLayersIn, 1, 1.79, almostLinear"
	   "fadeLayersOut, 1, 1.39, almostLinear"
	   "workspaces, 1, 6.94, easeOutQuint, slide"
	   "workspacesIn, 1, 6.21, easeOutQuint, slide"
	   "workspacesOut, 1, 6.94, easeOutQuint, slide"
	   "specialWorkspace, 1, 5, easeOutQuint, slide -50%"
	   "zoomFactor, 1, 7, quick"
	];
      };

      dwindle = {
        pseudotile = true;
	preserve_split = true;
      };

      master = {
        new_status = "master";
      };

      misc = {
        force_default_wallpaper = -1;
	disable_hyprland_logo = true;
      };

      # oh god its input time
      input = {
        kb_layout = us;

	repeat_delay = 200;
	repeate_rate = 25;

	follow_mouse = 1;

	sensitivity = 0;

	touchpad = {
          natural_scroll = false;
	};
      };

      gesture = "3, horizontal, workspace";

      device = {
        name = "epic-mouse-v1";
	sensitivity = -0.5;
      };

      # keybindings
      bind = [
        "${printMod}, exec, hyprshot -m region --clipboard-only";

	"${mainMod}, f, exec, ${brwoser}"

	"${mainMod}, Return, exec, ${terminal}"
	"${mainMod}, Delete, exit"
	"${mainMod}, C, killactive"
	"${mainMod}, V, togglefloating"
	"${mainMod}, R, exec, ${menu}"
	"${mainMod}, W, exec, ${wallpaperSwitcher}"
	"${mainMod}, N, exec, ${notes}"
      ];

    };
  };
}
