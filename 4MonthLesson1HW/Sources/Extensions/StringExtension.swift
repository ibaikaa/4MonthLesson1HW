//
//  StringExtension.swift
//  4MonthLesson1HW
//
//  Created by ibaikaa on 31/12/22.
//


extension String {
    var capitalizedSentence: String {
        // 1
        let firstLetter = self.prefix(1).capitalized
        // 2
        let remainingLetters = self.dropFirst().lowercased()
        // 3
        return firstLetter + remainingLetters
    }
}
