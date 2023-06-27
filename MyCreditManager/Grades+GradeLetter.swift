//
//  Grades+GradeLetter.swift
//  MyCreditManager
//
//  Created by Hyorim Nam on 2023/04/27.
//

import Foundation

class Grades {
    var grades: [String: GradeLetter] = [:]
    func addUpdateGrade(subject: String, grade: GradeLetter) {
        grades[subject] = grade
    }
    func calcGPA() -> Float {
        return grades.values.map {GradeLetter[$0]}.reduce(0.0, +) / Float(grades.count)
    }
}

enum GradeLetter: String {
    // swiftlint: disable identifier_name
    case A_plus = "A+"
    case A_zero = "A"
    case B_plus = "B+"
    case B_zero = "B"
    case C_plus = "C+"
    case C_zero = "C"
    case D_plus = "D+"
    case D_zero = "D"
    case F      = "F"
    // swiftlint: enable identifier_name

    static subscript(_ gradeString: String) -> Self? {
        return Self(rawValue: gradeString)
    }

    // 평균평점 계산용
    static subscript(_ gradeLetter: Self) -> Float {
        switch gradeLetter {
        case .A_plus: return 4.5
        case .A_zero: return 4.0
        case .B_plus: return 3.5
        case .B_zero: return 3.0
        case .C_plus: return 2.5
        case .C_zero: return 2.0
        case .D_plus: return 1.5
        case .D_zero: return 1.0
        case .F:      return 0.0
        }
    }
}
