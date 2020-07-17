//
//  Array+Only.swift
//  memorize
//
//  Created by Louis Ye on 7/17/20.
//  Copyright © 2020 Louis Ye. All rights reserved.
//

import Foundation

extension Array{
    var only: Element?{
        count == 1 ? first : nil
    }
}


