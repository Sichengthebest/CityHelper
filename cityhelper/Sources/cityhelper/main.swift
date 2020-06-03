import Foundation
import TelegramBotSDK

let token = readToken(from: "CITYHELPER_TOKEN")
let bot = TelegramBot(token: token)
var router = Router(bot: bot)

let e = InlineKeyboardButton(text: "English",callbackData: "e")
let f = InlineKeyboardButton(text: "Français", callbackData: "f")
let c = InlineKeyboardButton(text: "中文",callbackData: "c")

func onCallbackQueryc(context: Context) -> Bool {
    let markup = InlineKeyboardMarkup(inlineKeyboard: [[e,f]])

    if let _ = context.update.callbackQuery {
        context.bot.editMessageTextAsync(
            chatId: .chat(context.chatId!),
            messageId: context.message?.messageId,
            text: "垃圾在周四（法定节假日除外）从早上7:00到下午6:00收集。应在收集日当天的上午7:00前或前一天的晚上9:00后，将垃圾桶放到路边。确保在晚上11:00之前从路边收回垃圾箱",
            replyMarkup: ReplyMarkup.inlineKeyboardMarkup(markup)
        )
    }else{
        context.respondAsync("垃圾在周四（法定节假日除外）从早上7:00到下午6:00收集。应在收集日当天的上午7:00前或前一天的晚上9:00后，将垃圾桶放到路边。确保在晚上11:00之前从路边收回垃圾箱", replyMarkup: ReplyMarkup.inlineKeyboardMarkup(markup))
    }
    return true
}

func onCallbackQuerye(context: Context) -> Bool {
    let markup = InlineKeyboardMarkup(inlineKeyboard: [[c,f]])

    context.bot.editMessageTextAsync(
        chatId: .chat(context.chatId!),
        messageId: context.message?.messageId,
        text: "Garbage is picked up Thursdays (except statutory holidays) from 7:00 a.m. to 6:00 p.m. The bin should be put out by the curb after 9:00 p.m. the night before or before 7:00 a.m. the day of the collection. Make sure to take the bin back from the curb the same day before 11:00 p.m.",
        replyMarkup: ReplyMarkup.inlineKeyboardMarkup(markup)
    )
    return true
}

func onCallbackQueryf(context: Context) -> Bool {
    let markup = InlineKeyboardMarkup(inlineKeyboard: [[e,c]])
    
    context.bot.editMessageTextAsync(
        chatId: .chat(context.chatId!),
        messageId: context.message?.messageId,
        text: "Les jours de collecte sont les jeudis de 7 h à 18 h, sauf les jours fériés. Les bacs doivent être placés la veille à partir de 21 h ou avant 7 h le jour de la collecte, et doivent être rentrés le même jour avant 23 h.",
        replyMarkup: ReplyMarkup.inlineKeyboardMarkup(markup)
    )
    return true
}

router["GARBAGE"] = onCallbackQueryc
router[.callback_query(data: "c")] = onCallbackQueryc
router[.callback_query(data: "e")] = onCallbackQuerye
router[.callback_query(data: "f")] = onCallbackQueryf

while let update = bot.nextUpdateSync() {
    try router.process(update: update)
}


fatalError("Server stopped due to error: \(String(describing: bot.lastError))")
