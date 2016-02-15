//
//  ChatSummaryCellAdapter.swift
//  DaTestApp
//
//  Created by Maksim Bazarov on 11.02.16.
//  Copyright © 2016 Maksim Bazarov. All rights reserved.
//

import UIKit

/* 
 * Адаптер позволяет посчитать необходимую высоту ячейки, без лейаутинга, что экономит колосальное количество ресурса,
 * так как таблица запрашивает высоту для всех ячеек, а не только для тех ктороые видны, лейаутинг сразу всех ячеек таблицы может очень сильно тормозить
 * эта оптимизация возвращает нам стандартные 60 fps и как следствие "плавную" прокрутку
 */

class ChatSummaryCellAdapter: NSObject {


    class func cellHeight(forModel model: ChatDomainModel, cellWidth: CGFloat) -> CGFloat {

        let topMargin = CGFloat(8)
        let bottomMargin = CGFloat(8)
        let nameLabelHeight = CGFloat(21)
        let timeLabelHeight = CGFloat(21)
        let leftMargin = CGFloat(16)
        let rightAvatarMargin = CGFloat(8)
        let avatarWidth = CGFloat(48)

        let messageWidth = cellWidth - leftMargin - avatarWidth - rightAvatarMargin
        var messageHeigth = CGFloat(0)
        if let message = model.lastMessage {
            messageHeigth = TextSizeHelper.height(forText: message, font: UIFont.systemFontOfSize(13), width: messageWidth)
        }

        let cellHeight = topMargin + nameLabelHeight + topMargin + messageHeigth + topMargin + timeLabelHeight + bottomMargin

        return cellHeight
    }


}
