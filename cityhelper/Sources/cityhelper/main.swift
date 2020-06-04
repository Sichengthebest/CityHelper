import Foundation
import TelegramBotSDK

let token = readToken(from: "CITYHELPER_TOKEN")
let bot = TelegramBot(token: token)
var router = Router(bot: bot)

let garbage = CityCollection(
    router: &router,command: "garbage",
    defaultCall: "garbagecn",
    description: "不可回收垃圾收集",
    messageItems: [
        MessageItem(button: InlineKeyboardButton(text: "中文",callbackData: "garbagecn"), text: "不可回收垃圾在周四（法定节假日除外）从早上7:00到下午6:00收集。应在收集日当天的上午7:00前或前一天的晚上9:00后，将垃圾桶放到路边。确保在晚上11:00之前从路边收回垃圾箱"),
        MessageItem(button: InlineKeyboardButton(text: "English",callbackData: "garbageen"), text: "Garbage is picked up Thursdays (except statutory holidays) from 7:00 a.m. to 6:00 p.m. The bin should be put out by the curb after 9:00 p.m. the night before or before 7:00 a.m. the day of the collection. Make sure to take the bin back from the curb the same day before 11:00 p.m."),
        MessageItem(button: InlineKeyboardButton(text: "Français",callbackData: "garbagefr"), text: "Les jours de collecte sont les jeudis de 7 h à 18 h, sauf les jours fériés. Les bacs doivent être placés la veille à partir de 21 h ou avant 7 h le jour de la collecte, et doivent être rentrés le même jour avant 23 h."),
        MessageItem(button: InlineKeyboardButton(text: "Link",url: "https://www.beaconsfield.ca/en/garbage"),text: "")
    ]
)

let recycling = CityCollection(
    router: &router,
    command: "recycling",
    defaultCall: "recyclingcn",
    description: "可回收垃圾收集",
    messageItems: [
        MessageItem(button: InlineKeyboardButton(text: "中文",callbackData: "recyclingcn"), text: "可回收物的收集时间为每周四（法定假日除外）上午7:00至下午6:00。之前一天晚上9:00后，应将蓝色垃圾箱放置到路边。请务必在当天晚上11点前从路边取回垃圾箱。"),
        MessageItem(button: InlineKeyboardButton(text: "English",callbackData: "recyclingen"), text: "Recyclables are picked up Thursdays (except statutory holidays) from 7:00 a.m. to 6:00 p.m. The blue bin should be put out by the curb after 9:00 p.m. the night before or before 7:00 a.m. the day of the collection. Make sure to take the bin back from the curb the same day before 11:00 p.m."),
        MessageItem(button: InlineKeyboardButton(text: "Français",callbackData: "recyclingfr"), text: "Les jours de collecte sont les jeudis de 7 h à 18 h, sauf les jours fériés. Les bacs doivent être placés la veille à partir de 21 h ou avant 7 h le jour de la collecte, et doivent être rentrés le même jour avant 23 h."),
        MessageItem(button: InlineKeyboardButton(text: "Link",url: "https://www.beaconsfield.ca/en/recycling-sp-965503659"),text: "")
    ]
)

let greenResidue = CityCollection(
    router: &router,
    command: "greenresidue",
    defaultCall: "greenResiduecn",
    description: "绿色残留物收集（包括食品）",
    messageItems: [
        MessageItem(button: InlineKeyboardButton(text: "中文",callbackData: "greenResiduecn"), text: "绿色残留物收集（包括食品）的收集\n20号高速公路的南部地区：每周星期一上午7点开始\n20号高速公路北段：每周星期三上午7点开始"),
        MessageItem(button: InlineKeyboardButton(text: "English",callbackData: "greenResidueen"), text: "Food and green residue\nSouth sector of Highway 20: Mondays as of 7 a.m.\nNorth sector of Highway 20: Wednesdays as of 7 a.m. "),
        MessageItem(button: InlineKeyboardButton(text: "Français",callbackData: "greenResiduefr"), text: "résidus verts et alimentaires\nSecteur au sud de l'autoroute 20 : les lundis à partir de 7 h\nSecteur au nord de l'autoroute 20 : les mercredis à partir de 7 h "),
        MessageItem(button: InlineKeyboardButton(text: "Link",url: "https://www.beaconsfield.ca/en/green-residue-and-leaves"),text: "")
    ]
)

let neighbour = CityCollection(
    router: &router,
    command: "neighbour",
    defaultCall: "neighbourcn",
    description: "邻居噪音污染",
    messageItems: [
        MessageItem(button: InlineKeyboardButton(text: "中文",callbackData: "neighbourcn"), text: """
            车辆及建筑维修
            周一至周五：上午7点至晚上9点
            星期六：上午7点至下午5点。
            禁止在星期日和法定节假日进行这些活动。

            使用链锯、割草机、剪草机、剪草机、绿篱修剪机或其他类似设备
            周一至周五：上午7点至晚上9点
            之间星期六：上午7点至下午5点之间
            周日和法定节假日：中午至下午4点之间

            吹叶机
            从6月1日至9月30日禁止使用吹叶机，否则将被罚款。
            从10月1日到5月31日
            周一至周五：上午7点至晚上9点
            之间星期六：上午7点至下午5点之间
            周日和法定节假日：中午至下午4点之间
            """),
        MessageItem(button: InlineKeyboardButton(text: "English",callbackData: "neighbouren"), text: """
            Vehicle and building maintenance
            Monday to Friday: between 7 a.m. and 9 p.m.
            Saturday: between 7 a.m. and 5 p.m.
            It is FORBIDDEN to execute these activities on Sunday and statutory holidays.

            use of a chain-saw, lawn mower, grass trimmer, hedge trimmer or other similar devices is permitted as follows:
            Monday to Friday: between 7 a.m. and 9 p.m.
            Saturday: between 7 a.m. and 5 p.m.
            Sunday and statutory holidays: between noon and 4 p.m.

            LEAF BLOWER
            The use or operation of a leaf blower is prohibited from June 1 to September 30, subject to a fine.
            It is permitted from October 1 to May 31 as follows:
            Monday to Friday: between 7 a.m. and 9 p.m.
            Saturday: between 7 a.m. and 5 p.m.
            Sunday and statutory holidays: between noon and 4 p.m.
            """),
        MessageItem(button: InlineKeyboardButton(text: "Français",callbackData: "neighbourfr"), text: """
            Entretien des véhicules et des bâtiments
            Du lundi au vendredi : entre 7h et 21h
            Samedi : entre 7 heures et 17 heures
            Il est INTERDIT d'exercer ces activités le dimanche et les jours fériés.

            L'utilisation d'une scie à chaîne, d'une tondeuse à gazon, d'un coupe-herbe, d'un taille-haie ou de tout autre appareil similaire est autorisée comme suit :
            du lundi au vendredi : entre 7 h et 21 h
            Samedi : entre 7 heures et 17 heures
            Dimanche et jours fériés : entre 12 heures et 16 heures.

            SOUFFLEUR DE FEUILLES
            L'utilisation ou le fonctionnement d'un souffleur de feuilles est interdit du 1er juin au 30 septembre, sous peine d'amende.
            Elle est autorisée du 1er octobre au 31 mai comme suit :
            du lundi au vendredi : entre 7 heures et 21 heures
            Samedi : entre 7 heures et 17 heures
            Dimanche et jours fériés : entre 12 h et 16 h.
            """),
        MessageItem(button: InlineKeyboardButton(text: "Link",url: "https://www.beaconsfield.ca/en/living-in-beaconsfield/be-a-good-neighbour"),text: "")
    ]
)

bot.setMyCommandsAsync(commands: [
    greenResidue.botCommand,
    recycling.botCommand,
    garbage.botCommand,
    neighbour.botCommand
])


while let update = bot.nextUpdateSync() {
    try router.process(update: update)
}

fatalError("Server stopped due to error: \(String(describing: bot.lastError))")
