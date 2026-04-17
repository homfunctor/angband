4. clean code up
5. all the already existing todos...
6. change disko settings so vault is automatically owned by adminUser
7. backup drive was automatically claimed by work user, mairon. easy to fix but: why?
8. swayidle and swaylock refinement. add monitor turn off. see archwiki
9. can imperatively made secrets be stored via sops-nix?
10. hilarious bug discovered: sometimes instead of killing the screencast the screencast command makes another set of workspaces. this is repeatable. look for a better screencast command.
11. yazi derounding

brainstorming
if a module is imported by a tier-X module, then there's no need to check tiers. by definition the tiers they require are available---assuming the module isn't fucked up.
opts.tier.X.enabled is modified only in the corresponding tier-X module
tier-niceTTY is minimal tier for most optional features. arbitrary, just want to keep type-minTTY very bare bones.
imports are a problem.
