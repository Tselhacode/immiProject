//
//  pworkSections.swift
//  immi
//
//  Created by user217004 on 3/20/22.
//

import Foundation

class Section {
    let title: String!
    let items: [String]!
    var isHidden: Bool
    
    init(title:String, items:[String],isHidden:Bool = true){
        self.title = title
        self.items = items
        self.isHidden = isHidden
    }
}












