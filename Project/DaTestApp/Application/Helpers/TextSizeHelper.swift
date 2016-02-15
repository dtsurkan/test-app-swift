//
//  TextSizeHelper.swift
//  DaTestApp
//
//  Created by Maksim Bazarov on 11.02.16.
//  Copyright © 2016 Maksim Bazarov. All rights reserved.
//

import UIKit

class TextSizeHelper: NSObject {
    
    class func height(forText text:String, font:UIFont, width:CGFloat) -> CGFloat
    {
        let size = self.sizeForText(text, font: font, size: CGSize(width: CGFloat(width), height: CGFloat.max))
        return size.height
    }
    
    private class func sizeForText(text: String, font: UIFont, size: CGSize) -> CGSize
    {
        let textString = text as NSString
        let textAttributes = [NSFontAttributeName: font]
        
        let rect = textString.boundingRectWithSize(size, options: .UsesLineFragmentOrigin, attributes: textAttributes, context: nil)
        return rect.size
    }


}
