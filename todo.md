1. setup purpose-personal
2. implement opts.purpose so that switching between purposes requires just changing the imported module, and nothing else
   - idea is: no need to uncomment tons of modules when changing purpose (for testing or whatever).
   - example: something broke and i drop to niceTTY tier to debug. this will require just changing both instances of "purpose-foo" to "purpose-niceTTY" in the relevant imports blocks. stylix is initialized at that tier, but of the stylix-target modules only stylix-target-nixvim should be used. so stylix-target-nixvim requires purpose.niceTTY.enabled = true while the other stylix-target modules need purpose.work.enabled = true. this way nothing unwanted gets downloaded/installed, nothing complains about missing attribute sets, and only two lines in the entire config need to be changed.
3. setup syncthing and have it work better than last time
4. clean code up
5. all the already existing todos...
