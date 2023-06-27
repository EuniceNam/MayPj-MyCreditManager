//
//  InputInfoTrio.swift
//  MyCreditManager
//
//  Created by Hyorim Nam on 2023/06/27.
//

import Foundation

struct InputInfoTrio {
    let name: String
    let subject: String?
    let grade: String?

    init?(input: String, type: InfoType) {
        let words = input.split(separator: " ", maxSplits: 3)
        guard words.count == type.rawValue else { return nil }

        // check if input in right characters(a-zA-Z0-9)
        guard words[0].wholeMatch(of: inputRegex) != nil else { return nil }
        if words.count >= 2 { guard words[1].wholeMatch(of: inputRegex) != nil else { return nil } }
        // words.count 가 3이면 .addUpdateGrade인 경우로, "+"가 붙은 성적을 위해 거르지 않음
        // 성적입력의 범위는 Grade를 사용해 확인함

        name = String(words[0])
        if words.count >= 2 { subject = String(words[1]) } else { subject = nil }
        if words.count >= 3 { grade = String(words[2]) } else { grade = nil }
    }

    enum InfoType: Int {
        case student = 1
        case deleteGrade = 2
        case addUpdateGrade = 3
    }
}
