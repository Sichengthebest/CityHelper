import Foundation
import TelegramBotSDK

let token = readToken(from: "SIMPLE_BOT_TOKEN")
let bot = TelegramBot(token: token)

while let update = bot.nextUpdateSync() {
    if let message = update.message, let from = message.from, let text = message.text {
        let msg = """
        Hi \(from.firstName)! You said: \(text).
        from.id:\(from.id)
        from.username:\(from.username ?? "")
        from.languageCode:\(from.languageCode ?? "")
        from.firstName:\(from.firstName)
        message.chat.id:\(message.chat.id)
        message.chat.username:\(message.chat.username)
        message.chat.title:\(message.chat.title)
        message.replyToMessage?.chat.id:\(message.replyToMessage?.chat.id)
        message.replyToMessage?.from.id:\(message.replyToMessage?.from?.id)
        message.date\(message.date)
        """

        bot.sendMessageSync(chatId: ChatId.chat(message.chat.id),text: msg)
    }
}

fatalError("Server stopped due to error: \(String(describing: bot.lastError))")
