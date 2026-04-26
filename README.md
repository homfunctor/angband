Screenshot:
![no](https://github.com/homfunctor/angband/blob/60633340e70c113dfea8b0a90edceda9bd12637d/screenshot-2026-04-01-22%3A37%3A01.png)

# Main points

- Avoids excessive boilerplate by using opinionated directory structure and Numtide's Blueprint:
  - Hosts and users are declared in /hosts. For example, Blueprint generates the host **eregion** from **/hosts/eregion** and defines its sole user **annatar** from **/hosts/eregion/users/annatar**
  - Modules are automatically set up according to file or directory names in **/modules/nixos** and **/modules/home**.
  - A few basic functions are set up in **/lib/default.nix**.
- Instead I have my own excessive boilerplate:
  - Important options used throughout the flake's modules are set up in **/modules/nixos/opts.nix** and **/modules/home/opts.nix**
  - Typically I declare those options in **/hosts** and use them in **/modules**
  - An excessively over-complicated **opts.tier** set which declares the minimum tier required for a given module to exist. Tiers are
    - tier-minTTY: barebones installation settings
    - tier-niceTTY: slightly nicer TTY (with optional support for Stylix, Lanzaboote, Nixvim, and Sops-Nix - but all of these can be delayed until another tier or not used at all)
    - tier-work: final tier for work laptop and is the first tier that supports gui stuff like Niri and Noctalia-Shell
    - tier-personal: the fun stuff for my personal pc.

    The **opts.tier** stuff allows me to import all the modules I will eventually use in **/hosts** from the very beginning. Then I can switch between the used tiers by modifying only a few lines in a few files (to be specific, for each host the number of files that need to be modified for tier switching is: 1+n, where n is the number of users.

    I have not tested all the combinations, but I do have the following on my home pc:
    - host: tier-personal
    - users: tier-personal for main user, tier-work for work user.

    Why do all this? It's fun and kinda nice that only 2 or 3 lines need to be changed to completely switch up the configuration of a given device. But the same can be accomplished by just commenting modules out, which is probably a better option in most cases. Will likely simplify all this soon. I'm sure there's something in builtins or lib that already does all these things and in better ways. But it was a fun project.

- The config could probably be easily modified to easily switch to other shells, tiling managers, etc. because I avoided hard-coding things where I could - but no guarantees.
- I use Stylix for automatic theming of GTK and QT stuff. The QT stuff uses Kvantum. The source of the stolen code is in the module file. Also, I hate round corners. So I enforce sharp corners for GTK stuff and one day I'd like to do the same with QT. Noctalia-Shell has built-in support for this and I'm very grateful for that.
- Over-complicated modules for Niri. I use Niri-Flake. This allows me to use a stable version of Niri on my work laptop and unstable at home.
- Gaming stuff. Wine with Wayland. Eventually I'll declare video game options in the config. Eventually. Surely.
- Syncthing. Needs improving.
- A private flake is used for secrets and things I prefer to keep private. I like privacy. A lot. I use a simple approach where I define subsets of settings in a module in Utumno, my private flake, and then import that directly through imports in the relevant public module(s). Nothing too complicated.
- Nixvim config is always changing and always being debugged.
- Other stuff I'll add in here eventually. Surely.

InstallGuide.md is included here in case it helps someone else with installing their own config using disko and the minimal NixOS ISO. You too can feel like a cool hacker this way. And yes, there are ways to automate this process or do it better. I don't care.

I am a mathematician and therefore cannot program. Plagiarize at your own peril.
