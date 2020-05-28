import Foundation
import TelegramBotSDK

let token = readToken(from: "SIMPLE_BOT_TOKEN")
let bot = TelegramBot(token: token)

while let update = bot.nextUpdateSync() {
    if let message = update.message, let from = message.from, let text = message.text {
        bot.sendMessageAsync(chatId: ChatId.chat(from.id),
                             text: "Hi \(from.firstName)! You said: \(text).\n")
    }
}

fatalError("Server stopped due to error: \(String(describing: bot.lastError))")