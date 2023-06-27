//
//  GuideString.swift
//  MyCreditManager
//
//  Created by Hyorim Nam on 2023/05/04.
//

import Foundation

enum GuideString {
    enum MainMenu {
        static let menuGuide = """
        원하는 기능을 입력해주세요
        1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료
        """
        static let inputError = "입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요."
        static let exit = "프로그램을 종료합니다…"
    }
    enum Student: CustomStringConvertible {
        static let addGuide = "추가할 학생의 이름을 입력해주세요."
        static let deleteGuide = "삭제할 학생의 이름을 입력해주세요."
        static let averageGradeGuide = "평점을 알고싶은 학생의 이름을 입력해주세요"

        case addAccepted(name: String)
        case deleteAccepted(name: String)

        var description: String {
            switch self {
            case let .addAccepted(name): return "\(name) 학생을 추가했습니다."
            case let .deleteAccepted(name): return "\(name) 학생을 삭제했습니다."
            }
        }
    }
    enum Grade: CustomStringConvertible {
        static let addUpdateGuide = """
        성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.
        입력예) Mickey Swift A+
        만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.
        """
        static let deleteGuide = """
        성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.
        입력예) Mickey Swift
        """

        case addUpdateAccepted(name: String, subject: String, grade: String)
        case deleteAccepted(name: String, subject: String)

        var description: String {
            switch self {
            case let .addUpdateAccepted(name, subject, grade):
                return "\(name) 학생의 \(subject) 과목이 \(grade)로 추가(변경) 되었습니다."
            case let .deleteAccepted(name, subject):
                return "\(name) 학생의 \(subject) 과목의 성적이 삭제되었습니다."
            }
        }
    }
}

enum CustomError: Error {
    case inputError
    case noStudent(name: String)
    case studentExists(name: String)
    case noSubject(name: String, subject: String)
    case noGrade(name: String)
}
extension CustomError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .inputError:
            return "입력이 잘못되었습니다. 확인해주세요."
        case let .noStudent(name):
            return "\(name) 학생을 찾지 못했습니다."
        case let .studentExists(name):
            return "\(name) 학생은 이미 존재합니다. 추가하지 않습니다."
        case let .noSubject(name, subject):
            return "\(name) 학생의 \(subject) 과목의 성적을 찾지 못했습니다."
        case let .noGrade(name):
            return "\(name) 학생의 성적이 없습니다."
        }
    }
}
