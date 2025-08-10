--██████╗ ██╗███╗   ██╗ ██████╗     ███████╗ ██████╗██████╗ ██╗██████╗ ████████╗███████╗--
--██╔══██╗██║████╗  ██║██╔═══██╗    ██╔════╝██╔════╝██╔══██╗██║██╔══██╗╚══██╔══╝██╔════╝--
--██║  ██║██║██╔██╗ ██║██║   ██║    ███████╗██║     ██████╔╝██║██████╔╝   ██║   ███████╗--
--██║  ██║██║██║╚██╗██║██║   ██║    ╚════██║██║     ██╔══██╗██║██╔═══╝    ██║   ╚════██║--
--██████╔╝██║██║ ╚████║╚██████╔╝    ███████║╚██████╗██║  ██║██║██║        ██║   ███████║--
--╚═════╝ ╚═╝╚═╝  ╚═══╝ ╚═════╝     ╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝        ╚═╝   ╚══════╝--
                                                                                    
Config = {}

-- Key to toggle the Speed Lock (https://docs.fivem.net/docs/game-references/controls/)
Config.ToggleKey = 301 -- Default: Y key

-- Minimum speed (in km/h) required to activate the Speed Lock
Config.MinSpeed = 10

-- Cooldown time between toggles in milliseconds
Config.Cooldown = 3000

-- Anti-Burnout: Prevents tires from spinning when Speed Lock is active
Config.AntiBurnout = true

-- Show a notification when cooldown is active
Config.ShowCooldownNotify = true

-- Speed tolerance in km/h (how precise the speed lock should be)
Config.SpeedToleranceKmh = 1.0

-- Notification function
Config.Notify = function(title, text, position, duration, color, icon)
    TriggerEvent("swt_notifications:Icon", title, position or "top", duration or 4000, color or "green-7", "white", true, icon or "mdi-earth")
end
