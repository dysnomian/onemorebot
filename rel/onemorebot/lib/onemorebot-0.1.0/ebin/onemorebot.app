{application,onemorebot,
             [{applications,[kernel,stdlib,elixir,logger,slack,cowboy,plug,
                             distillery]},
              {description,"onemorebot"},
              {modules,['Elixir.Onemorebot','Elixir.Onemorebot.Application',
                        'Elixir.Onemorebot.Router',
                        'Elixir.Onemorebot.SlackRtm']},
              {registered,[]},
              {vsn,"0.1.0"},
              {extra_applications,[logger,slack,cowboy,plug]},
              {mod,{'Elixir.Onemorebot.Application',[]}}]}.