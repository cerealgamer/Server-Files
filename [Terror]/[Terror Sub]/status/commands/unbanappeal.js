const resourcePath = global.GetResourcePath ?
    global.GetResourcePath(global.GetCurrentResourceName()) : global.__dirname
const settingsjson = require(resourcePath + '/settings.js')

exports.runcmd = (fivemexports, client, message, params) => {
    message.delete()
    let embed = {
        "title": "HVC Unban Appeal",
        "description": `https://discord.gg/QxyBphgPZB`,
        "color": settingsjson.settings.botColour,
        "footer": {
            "text": ""
        },
        "timestamp": new Date()
    }
    message.channel.send({ embed })
}

exports.conf = {
    name: "unbanappeal",
    perm: 0
}