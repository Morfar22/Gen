PerformHttpRequest('https://discord.com/api/webhooks/982790576783122513/Nadmkeqsn27219GjUMD9R1kW0N4FgIzEzq9-E612UIK9sBrCUq5hxtSajVHatHMnoGUL', function(err, text, headers) end, 'POST', json.encode(
    {
        username = "Generation - Server drift",
        embeds = {
            {              
              title = "Serveren er lige blevet åbnet!";
              description = "Forbind til serveren med IP:**\n**```connect cfx.re/join/z9plv5```";
              color = 359935;
              footer = {
                text = "Tak fordi du valgte Generation!"
              }
            }
        }
    }), { ['Content-Type'] = 'application/json' })