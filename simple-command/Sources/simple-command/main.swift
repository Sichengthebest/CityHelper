import Foundation
import TelegramBotSDK

let token = readToken(from: "SIMPLE_COMMAND_TOKEN")
let bot = TelegramBot(token: token)
let router = Router(bot: bot)
let logChatId : ChatId = ChatId.chat( Int64(readToken(from: "LOGCHATID")) ?? 0)

// 创建一个函数，接受一个Context的参数，并返回Bool好设置到router的一个命令中去
func help(context: Context) -> Bool {
    if !context.slash { return false }
    context.respondAsync("""
        我现在提供不了什么服务，你可以输入 /collection 感受一下我的技能。
    """)
    return true
}

// 直接使用{}创建一个函数，context接受转入的调用
router["collection"] = { context in
    context.respondAsync("""
        我可以告诉你收垃圾的信息呢。
        """)
    return true
}

router["start"] = help
router["help"] = help

bot.sendMessageSync(chatId: logChatId, text: "开始运行")
// 等待有人发消息
while let update = bot.nextUpdateSync() {
    // 将发来的消息放到router中去处理
    try router.process(update: update)
}

fatalError("Server stopped due to error: \(String(describing: bot.lastError))")
