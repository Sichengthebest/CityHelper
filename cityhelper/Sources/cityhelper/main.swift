import Foundation
import TelegramBotSDK

// 机器人的token
let token = readToken(from: "CITYHELPER_TOKEN")
let bot = TelegramBot(token: token)
let router = Router(bot: bot)
// 我们可能会向自己发送一些log或调试信息，使用LOGCHATID指定发送目标
let logChatId : ChatId = ChatId.chat( Int64(readToken(from: "LOGCHATID")) ?? 0)

func help(context: Context) -> Bool {
    if !context.slash { return false }
    context.respondAsync("""
        我是Beaconsfield小助手，现在提供不了什么服务，你可以输入 /collection 感受一下我的技能。
    """)
    return true
}

router["collection"] = { context in
    context.respondAsync("""
        垃圾在周四（法定节假日外）的上午7点到下午6点进行收集。请你在头一天晚上9点后将垃圾桶放到路边，而在垃圾收集日当天晚上11点前从路边将垃圾桶收回。说明请见： https://www.beaconsfield.ca/en/garbage

        绿色垃圾，20号高速以南周一上午7点开始收集，20号高速以北周三上午7点开始收集。说明详见： https://www.beaconsfield.ca/en/green-residue-and-leaves
        """)
    return true
}

router["start"] = help
router["help"] = help

bot.sendMessageSync(chatId: logChatId, text: "开始运行")
while let update = bot.nextUpdateSync() {
    try router.process(update: update)
}
