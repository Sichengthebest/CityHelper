import Foundation
import TelegramBotSDK

let token = readToken(from: "SIMPLE_BOT_TOKEN")
let bot = TelegramBot(token: token)

while let update = bot.nextUpdateSync() {
    if let message = update.message, let from = message.from, let text = message.text {
        
        let msg = """
        Hi \(from.firstName)! You said: \(text).
        ID:\(from.id)
        username:\(from.username ?? "")
        languageCode:\(from.languageCode ?? "")
        firstName:\(from.firstName)
        ChatId:\(message.chat.id)
        """
        
        bot.sendMessageSync(chatId: ChatId.chat(message.chat.id),text: msg)
    }
}

fatalError("Server stopped due to error: \(String(describing: bot.lastError))")
