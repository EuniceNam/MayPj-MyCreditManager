//
//  GuideString.swift
//  MyCreditManager
//
//  Created by Hyorim Nam on 2023/05/04.
//

import Foundation

enum GuideString {
    case mainMenu(error: Bool)
    case inputError
    // case studentManage(error: Bool, case: Bool, existence: Bool)
    enum Student {
        case add(error: Bool, existence: Bool)
        case del(error: Bool, existence: Bool)
    }
    enum Grade {
        case add
        case del
        case gpa
    }
}
