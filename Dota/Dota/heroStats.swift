//
//  heroStats.swift
//  Dota
//
//  Created by Adroitent INC on 06/03/18.
//  Copyright © 2018 Adroitent INC. All rights reserved.
//

import Foundation


struct heroStats: Decodable
{
    
    let localized_name: String
    let primary_attr: String
    let attack_type: String
    let legs: Int
}
