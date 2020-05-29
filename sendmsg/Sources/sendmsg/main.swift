import Foundation
import TelegramBotSDK

let token = readToken(from: "SENDMSG_TOKEN")
let chatId : ChatId = ChatId.chat( Int64(readToken(from: "CHATID")) ?? 0)
let bot = TelegramBot(token: token)

func sendSync(text: String) {
    bot.sendMessageSync(chatId: chatId, text: text)
}

func sendAsync(text: String){
    bot.sendMessageAsync(chatId: chatId, text: text)
}

sendAsync(text: "hello Async")
sendSync(text: "hello Sync")
