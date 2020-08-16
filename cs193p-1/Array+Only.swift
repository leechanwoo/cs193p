//
//  Array+Only.swift
//  cs193p-1
//
//  Created by chanwoo on 2020/08/09.
//  Copyright © 2020 chanwoo. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil 
    }
}
