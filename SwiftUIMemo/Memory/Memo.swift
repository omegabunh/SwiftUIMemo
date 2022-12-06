//
//  Memo.swift
//  SwiftUIMemo
//
//  Created by 박성우 on 2022/12/06.
//

import Foundation
import SwiftUI

class Memo: Identifiable, ObservableObject{
    let id:UUID
    @Published var content: String
    let insertDate: Date
    
    init(content: String, insertDate: Date = Date.now){
        id=UUID()
        self.content=content
        self.insertDate=insertDate
    }
}
