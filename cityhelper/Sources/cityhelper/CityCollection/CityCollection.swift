//
//  CityCollection.swift
//  cityhelper
//
//  Created by Danny Huang on 2020-06-03.
//

import Foundation
import TelegramBotSDK

struct MessageItem{
    var button : InlineKeyboardButton
    var text : String
}

class CityCollection{
    // 这组markup的button列表
    var buttons: [MessageItem] = []
    // 这组markup的注册BotCommand
    var botCommand: BotCommand
    
    /**
     初化一个CityCollection，并在router中加入所有带有callbackData的button的回调函数
     
     - parameter router - 使用bot初始化出来的router
     - parameter command - 为公开声明的command，会在对话框中增加一个`/`来帮助你快速调用
     - parameter defaultCall - command时会调用的button的callbackData名称
     - parameter description - 在快捷提示command时的说明
     - parameter messageItems - 所有会在消息下的列表
     */
    init( router : inout Router, command: String ,defaultCall: String ,description: String ,messageItems : [MessageItem] ){
        
        self.buttons = messageItems
        self.botCommand = BotCommand(command: command, description: description)
        
        // 生成标准的回调，只要是带有callbackData的都会生成一个callback_query的回调
        for i in messageItems {
            if let callBack = i.button.callbackData {
                // 把messageItems中的InlineKeyboardButton取出来放到buttons中去
                var buttons : [InlineKeyboardButton] = []
                for j in messageItems {
                    // 排除自己
                    if j.button.callbackData != i.button.callbackData {
                        buttons.append(j.button)
                    }
                }
                
                router[.callback_query(data: callBack)] = { context in
                    context.bot.editMessageTextAsync(
                        chatId: .chat(context.chatId!),
                        messageId: context.message?.messageId,
                        text: i.text,
                        replyMarkup: .inlineKeyboardMarkup(InlineKeyboardMarkup(inlineKeyboard: [buttons]))
                    )
                    return true
                }
                
                // 如果这个callback是defaultCall，还会多为route增加一个针对command的回调
                if callBack == defaultCall {
                    router[command] = { context in
                        context.respondAsync(
                            i.text,
                            replyMarkup: .inlineKeyboardMarkup(InlineKeyboardMarkup(inlineKeyboard: [buttons]))
                        )
                        return true
                    }
                }
            }
        }
    }
}
