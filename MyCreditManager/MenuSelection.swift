//
//  MenuSelection.swift
//  MyCreditManager
//
//  Created by Hyorim Nam on 2023/06/27.
//

import Foundation

enum MenuSelection: Int {
    static let numberRange = 1...5
    case createStudent = 1
    case removeStudent
    case addUpdateGrade
    case deleteGrade
    case printGPA
    case exit // user input: "X"
    case notInMenu

    static subscript(_ menuString: String) -> Self {
        if menuString == "X" || menuString == "x" {
            return .exit
        }
        guard let menuSelection = Int(menuString), numberRange ~= menuSelection,
              let self = Self(rawValue: menuSelection) else {
            return .notInMenu
        }
        return self
    }
}
