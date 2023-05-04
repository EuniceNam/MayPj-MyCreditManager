//
//  main.swift
//  MyCreditManager
//
//  Created by Hyorim Nam on 2023/04/23.
//

import Foundation

typealias StudentRecord = [String: Grades]
typealias Grade = (subject: String, grade: GradeLetter)

// - MARK: main

var students: StudentRecord = [:]

menuLoop: while true {
    print("메뉴")
    if let menuInput = readLine() {
        switch (MenuSelection[menuInput.trimmingCharacters(in: .whitespaces)]) {
        case .createStudent:
            print("학생추가")
            if let studentName = readLine() {
                createStudent(studentName)
            } else {
                print("")
            }
        case .removeStudent:
            print("학생삭제")
        case .updateGrade:
            print("성적 추가/변경")
        case .deleteGrade:
            print("성적 삭제")
        case .printGPA:
            print("평균성적 출력")
            print(String(format: "%.2f"), 123.342)
        case .exit:
            break menuLoop
        default:
            print("입력오류")
            
        }
    }
}

// - MARK: functions

func createStudent(_ name: String) {
    
}
func removeStudent(_ name: String) {
    
}

// - MARK: help enumerations

enum MenuSelection: Int {
    case createStudent = 1
    case removeStudent
    case updateGrade
    case deleteGrade
    case printGPA
    case exit

    static subscript(_ menuString: String) -> Self? {
        guard let menuSelection = Int(menuString) else {return nil}
        return Self(rawValue: menuSelection)
    }
}
