local discord_webhook = {
    url = "https://discord.com/api/webhooks/820305531159314442/sXb_JrHgjGfR89byU9DnOMmM9RUrydJoNsmTQ2rHP4m5CqXTS6WmPdiq1hJ0G3hGCbnt",
    image = ""
}

AddEventHandler("chatMessage", function(source, author, text)
    PerformHttpRequest(discord_webhook.url,
    function(err, text, header) end,
    'POST',
    
    json.encode({username = author, content = text, avatar_url = discord_webhook.image }), {['Content-Type'] = 'application/json'})
end)