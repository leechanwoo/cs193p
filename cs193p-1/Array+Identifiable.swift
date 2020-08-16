//
//  Array+Identifiable.swift
//  cs193p-1
//
//  Created by chanwoo on 2020/08/09.
//  Copyright © 2020 chanwoo. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
            for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}
