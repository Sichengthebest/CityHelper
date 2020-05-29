import Foundation
import TelegramBotSDK

let token = readToken(from: "SIMPLE_BOT_TOKEN")
let bot = TelegramBot(token: token)

while let update = bot.nextUpdateSync() {
    if let message = update.message, let from = message.from, let text = message.text {
        bot.sendMessageAsync(chatId: ChatId.chat(from.id),
                             text: "Hi \(from.firstName)! You said: \(text).\n")
        bot.sendMessageAsync(chatId: ChatId.chat(from.id), text:
            "ID:\(from.id)\nusername:\(from.username ?? "")\nlanguageCode:\(from.languageCode ?? "")\nfirstName:\(from.firstName)")
    }
}

fatalError("Server stopped due to error: \(String(describing: bot.lastError))")
