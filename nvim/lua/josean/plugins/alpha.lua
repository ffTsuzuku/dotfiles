return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Set header
    dashboard.section.header.val = [[
                                          ...............                                           
                                   ........              .........                                  
                              ......    ..:^~!7??????7!~^:..     .....                              
                          .....   .:~?YPBB##BBBGGGGGGBBB##BBPY?!^.   .....                          
                        ...   .^?5B##GPJ7!^:...      ...:^~7J5G##BP?~.   ....                       
                     ....  .!YB#BP?~:                          :~?5B#B5!.  ....                     
                   ...   ~YB&GJ~.    ..^J5PP5J?7!~~!7?JY5PGP5?:    .~JG##5~   ...                   
                 ...  .7G&BY~     ~JPBGB&#&PYPB&&##&&#GP5B###&BGBGJ:   ^JB&G7.  ...                 
                ..   7G&G7.     ^5&&##&###?   .~5##5!:   :B###&&BGGB?    .7G&B7.  ..                
              ...  ~G&B7.     .J#&5~.^Y###~      ^^      .B###P!.  ~#P^     !G&G~  ...              
             ..  .J##J.     .!G&&5     !B&?              7#&B!      Y&#5!.   .?#&Y.  ..             
            ..  :P&G~    .~YB&&&&~      ^GG.            .G&P:       Y&#&&BJ^   ^P&G:  ..            
           ..  ^B&5.  .!YBB5J???7.       :G5            J&P.        :~~!?YB#G7  .Y&B^  ..           
          ..  :B&5.   5&&B:               :BY          !#B:                ?&&5   Y&B^  ..          
          .. .P&P.   .G###J.               ~#5:  !!   !#&7               .~P###!   5&G. ..          
         ..  J&B^   7G##&&&BJ^             :B&BYYPPYJP&&#Y~!^         :!YB&&####P: :B&Y  ..         
         .  :B&?   :###GYY5PGBPJ!:.     755PY!:.:~~^::~JG&&&7    .^7YGBBBGGPB###&!  7&#^  .         
        ..  ?&B:   :B#B:     .^!?JJJ?7~~G&J^!JJ!P###J~7!^7B#B5Y5PG5J7~:..   .!B##^  .B&J  ..        
        ..  P&5     5##7           .~?P&#~ !&&&&5PGPB&&&5 :G##GJ~.           ~#&5    Y&P  ..        
        .. .G&J     ~###J.            :B? ^JB#57!JY~~P##P^ ~#G:            :J##&7    7&G. ..        
        .. .B&?     ^###&5.          ~G#^.B&##?~&&&&^?##&B..B#5^          ^G&##&7    7&G. ..        
        .. .G&J     7##G!.            !#? ~5##Y~755!:Y##P~ !&P.            :Y###5    ?&G. ..        
        ..  5&5     P&5.           :~JG&#~ J&&&BYPGYG&&&P ^B&#Y!:.           ?##B:   Y&P  ..        
        .:  7&B:   ^##5^.  ...^~7JY5Y?77Y#J~?YJ?B&&#??YJ!?#G~~7?JJJ?7~:.     ^##&7  .B&?  :.        
         .. :B&J   ^####GGGBBGPY7^.     .B#BY!^.^!!^.:!YGPP?      .^7YGBGP555B#&G^  7&B: ..         
         ..  7&#^   ~5###&BY!:          .::!#&#PYPGG5G&#~             .!P#&###B?.  :B&?  ..         
          ..  5&P.   :###5.                ~#G^  ^Y^ .?#7                ^G####:  .P&P. ..          
          ..  .G&5.   7B&G!:              :BG:         !B!               .P&#P7   Y&G:  ..          
           ..  :P&P:   :7P##G5YJ!        :P#~           !#!        7YYY5PGP?^   .5&G:  ..           
            ..  .Y&B~     :7P&&&5       ^G&J             J#?       G&&&B?:     ~G&5.  ..            
             ...  7#&J.      ~5&P     :J#&G.             :B&Y.    ~#&B?.     .J##?  ...             
               ..  ^5&B?.      !GJ^^~YB&#&?       :       P#&B?::7B&5:     .7B&5^  ..               
                ...  ~P&B?:     .J##&&&###7    :7P#P!.   .G##&&##&B?     .?G&P!  ...                
                  ..   ~5##Y~.    ^7??Y#&&B5YYPBBBBBBPJ??G&&#57?7~.   .~Y##P!  ...                  
                   ....  ^JG#BY!:      ^!???7~^:.....::^!77!^      .~YB#GJ^   ...                   
                      ...   ^JG##PJ!^.                        .:!JPB#GJ~   ....                     
                        ....   :!YPB#BPY?!~^:...    ...:^~!?YPB#BPJ!:   ....                        
                           ....    .^!J5GBBBBBBBGGGGBBBBBBGP5J!^.    ....                           
                               .....     ..:^~~!!!!!!~~^:..     .....                               
                                    .........          .........                                    
                                             ...........                                            
                                                                                                    
                          Leaves from the vine, drifting so slow. 
                          Brave little soldier boy, comes marching home...

    ]]

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
      dashboard.button("SPC ee", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
      dashboard.button("SPC ff", "󰱼  > Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("SPC fs", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("SPC wr", "󰁯  > Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
      dashboard.button("q", "  > Quit NVIM", "<cmd>qa<CR>"),
    }

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
