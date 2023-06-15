//  Resources.swift
//  SomeApp
//
//  Created by Steellson.
//

import UIKit

enum R {
    
    enum Colors {
        static let deepGrayBackgroundColor = UIColor(red: 45/255, green: 45/255, blue: 45/255, alpha: 1)
        static let shadowGrayColor = UIColor(red: 124/255, green: 124/255, blue: 124/255, alpha: 1)
        static let specialWhiteColor = UIColor(red: 254/255, green: 254/255, blue: 254/255, alpha: 1)
        static let specialBlueColor = UIColor(red: 166/255, green: 182/255, blue: 240/255, alpha: 1)
        static let specialLimeColor = UIColor(red: 230/255, green: 250/255, blue: 168/255, alpha: 1)
        static let specialPinkColor = UIColor(red: 204/255, green: 160/255, blue: 243/255, alpha: 1)
    }
    
    enum Strings: String {
        case greetingLabel = "Hi dude!"
        case nameLabelText = "Write your name down:"
        case nameFieldPlaceholder = "Here..."
        case startButtonTitle = "Go!"
        
        case greatingLabelTD = "Hey, "
        case letsPlainLabel = "let's plain!"
        case greatingSubtitleText = "Are u ready for hardworking today? :)"
        case searchViewPlaceholder = "Type here ..."
        case todayTasksLabel = "Today tasks"
        
        case addTaskTextLabel = "Write you task here!"
        
        case tdCellReuseIdentifier = "TDCell"
    }
    
    enum Images {
        static let textFieldSpacer = UIImage(systemName: "arrow.right.to.line")
        static let searchViewImage = UIImage(systemName: "magnifyingglass")
        static let isDoneMarkImage = UIImage(systemName: "checkmark")
        static let deleteMarkImage = UIImage(systemName: "xmark")
        static let editmarkImage = UIImage(systemName: "pencil")
        static let addTaskButtonImage = UIImage(systemName: "plus")
        static let calendarButtonImage = UIImage(systemName: "calendar")
        static let cancelButtonImage = UIImage(systemName: "arrowshape.turn.up.backward.2.fill")
    }
}
