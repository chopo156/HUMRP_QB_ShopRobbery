--------HUMBELBEGGAR---------------------
---#####商店抢劫#####-------------


Config = {}
Translation = {}

Config.ShopOwner = 416176080 
Config.Locale = 'en' 

Config.Shops = {
    ---------------------------------------------------！！！不要更改这几个: hours, minutes, seconds！！！-----------------------------------------------------------------------------------------
    
    {coords = vector3(1134.02, -983.34, 45.42-0.98), heading = 277.6, money = {3000, 5000}, cops = 3, blip = false, name = 'Robbery market', cooldown = {hour = 0, minute = 0, second = 30}, robbed = false},
    {coords = vector3(1392.63, 3606.41, 34.98-0.98), heading = 203.18, money = {3000, 5000}, cops = 3, blip = false, name = 'Robbery market', cooldown = {hour = 0, minute = 0, second = 30}, robbed = false},
    {coords = vector3(372.22, 326.68, 102.57-0.98), heading = 258.03, money = {3000, 5000}, cops = 3, blip = false, name = 'Robbery market', cooldown = {hour = 0, minute = 0, second = 30}, robbed = false},
	{coords = vector3(24.38, -1346.91, 28.5-0.98), heading = 267.53, money = {3000, 5000}, cops = 3, blip = false, name = 'Robbery market', cooldown = {hour = 0, minute = 0, second = 30}, robbed = false},
	{coords = vector3(-1221.71, -908.53, 12.33-0.98), heading = 33.95, money = {3000, 5000}, cops = 0, blip = false, name = 'Robbery market', cooldown = {hour = 0, minute = 0, second = 30}, robbed = false},

}

Translation = {
    ['en'] = {
        ['ShopOwner'] = 'Shop owner',
        ['robbed'] = "I just got robbed, no money left in the safe!",
        ['cashrecieved'] = 'Money out of the safe',
        ['currency'] = '$',
        ['scared'] = 'Afraid:',
        ['no_cops'] = 'Not enough cops (at least 3 cops required)!',
        ['cop_msg'] = 'The person whose name is mentioned is now robbing the market!',
        ['set_waypoint'] = 'Mark the shop',
        ['hide_box'] = 'Close the box',
        ['robbery'] = 'The market named is now robbed',
        ['walked_too_far'] = 'The robbery has been canceled!'
    },
    ['sv'] = {
        ['ShopOwner'] = 'Shop owner',
        ['robbed'] = "I just got robbed, no money left in the safe!",
        ['cashrecieved'] = 'Money out of the safe',
        ['currency'] = '$',
        ['scared'] = 'Afraid:',
        ['no_cops'] = 'Not enough cops (at least 3 cops required)!',
        ['cop_msg'] = 'The person whose name is mentioned is now robbing the market!',
        ['set_waypoint'] = 'Mark the shop',
        ['hide_box'] = 'Close the box',
        ['robbery'] = 'The market named is now robbed',
        ['walked_too_far'] = 'The robbery has been canceled!'
    },
    ['cn'] = {
        ['ShopOwner'] = '商店拥有者',
        ['robbed'] = "才刚被抢过!",
        ['cashrecieved'] = '钱从保险箱拿出了',
        ['currency'] = '$',
        ['scared'] = '害怕:',
        ['no_cops'] = '没有足够的警察（最少3个）!',
        ['cop_msg'] = '提到名字的人现在正在抢劫超市!',
        ['set_waypoint'] = '标记商店',
        ['hide_box'] = '关闭盒子',
        ['robbery'] = '标记的超市现在被抢劫了',
        ['walked_too_far'] = '你离的太远了，抢劫已被取消!'
    }
}