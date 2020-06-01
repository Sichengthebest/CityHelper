import Foundation
import TelegramBotSDK

// 机器人的token
let token = readToken(from: "CITYHELPER_TOKEN")
let bot = TelegramBot(token: token)
let router = Router(bot: bot)
// 我们可能会向自己发送一些log或调试信息，使用LOGCHATID指定发送目标
let logChatId : ChatId = ChatId.chat( Int64(readToken(from: "LOGCHATID")) ?? 0)
