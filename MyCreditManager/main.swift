//
//  main.swift
//  MyCreditManager
//
//  Created by Hyorim Nam on 2023/04/23.
//

import Foundation

// - MARK: main

var studentRecords: [String: Grades] = [:]
let inputRegex = try Regex(#"[a-zA-Z0-9]+"#)

menuLoop: while true {
    print(GuideString.MainMenu.menuGuide)
    if let menuInput = readLine() {
        let selectedMenu = MenuSelection[menuInput.trimmingCharacters(in: .whitespaces)]
        switch selectedMenu {
        case .createStudent:
            do { try createStudent() } catch { print(error.localizedDescription) }
        case .removeStudent:
            do { try removeStudent() } catch { print(error.localizedDescription) }
        case .addUpdateGrade:
            do { try addUpdateGrade() } catch { print(error.localizedDescription) }
        case .deleteGrade:
            do { try deleteGrade() } catch { print(error.localizedDescription) }
        case .printGPA:
            do { try printGPA() } catch { print(error.localizedDescription) }
        case .exit:
            break menuLoop
        case .notInMenu:
            print(GuideString.MainMenu.inputError)
        }
    }
}

// - MARK: functions

func createStudent() throws {
    print(GuideString.Student.addGuide)
    guard let input = readLine(), let info = InputInfoTrio(input: input, type: .student) else {
        throw CustomError.inputError
    }
    guard studentRecords[info.name] == nil else {
        throw CustomError.studentExists(name: info.name)
    }
    studentRecords[info.name] = Grades()
    print(GuideString.Student.addAccepted(name: info.name))
}

func removeStudent() throws {
    print(GuideString.Student.deleteGuide)
    guard let input = readLine(), let info = InputInfoTrio(input: input, type: .student) else {
        throw CustomError.inputError
    }
    guard studentRecords[info.name] != nil else {
        throw CustomError.noStudent(name: info.name)
    }
    studentRecords[info.name] = nil
    print(GuideString.Student.deleteAccepted(name: info.name))
}

func addUpdateGrade() throws {
    print(GuideString.Grade.addUpdateGuide)
    guard let input = readLine(),
          let info = InputInfoTrio(input: input, type: .addUpdateGrade),
          let subject = info.subject,
          let grade = info.grade,
          let gradeLetter = GradeLetter[grade] else {
        throw CustomError.inputError
    }
    guard let studentGrades = studentRecords[info.name] else {
        throw CustomError.noStudent(name: info.name)
    }
//    studentGrades.addUpdateGrade(subject: subject, grade: gradeLetter)
    studentGrades.grades[subject] = gradeLetter
    print(GuideString.Grade.addUpdateAccepted(name: info.name, subject: subject, grade: grade))
}

func deleteGrade() throws {
    print(GuideString.Grade.deleteGuide)
    guard let input = readLine(),
          let info = InputInfoTrio(input: input, type: .deleteGrade),
          let subject = info.subject else {
        throw CustomError.inputError
    }
    guard let studentGrades = studentRecords[info.name] else {
        throw CustomError.noStudent(name: info.name)
    }
    guard studentGrades.grades[subject] != nil else {
        throw CustomError.noSubject(name: info.name, subject: subject)
    }
    studentGrades.grades[subject] = nil
    print(GuideString.Grade.deleteAccepted(name: info.name, subject: subject))
}

func printGPA() throws {
    print(GuideString.Student.averageGradeGuide)
    guard let input = readLine(),
          let info = InputInfoTrio(input: input, type: .student) else {
        throw CustomError.inputError
    }
    guard let studentGrades = studentRecords[info.name] else {
        throw CustomError.noStudent(name: info.name)
    }
    guard !studentGrades.grades.isEmpty else {
        throw CustomError.noGrade(name: info.name)
    }

    let sortedGrades = studentGrades.grades.sorted(by: {$0.0 < $1.0})
    for grade in sortedGrades {
        print("\(grade.key): \(grade.value.rawValue)")
    }
    print(String(format: "평점: %.2f", studentGrades.calcGPA()))
}
