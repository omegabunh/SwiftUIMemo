//
//  MemoStore.swift
//  SwiftUIMemo
//
//  Created by 박성우 on 2022/12/06.
//

import Foundation

class MemoStore: ObservableObject{
    @Published var list: [Memo]
    
    init(){
        list = []
        
    }
    func insert(memo: String){
        list.insert(Memo(content: memo), at: 0)
    }
    
    func update(memo: Memo?, content: String){
        guard let memo = memo else{
            return
        }
        memo.content = content
    }
    
    func delete(memo: Memo){
        list.removeAll{$0.id == memo.id}
    }
    
    func delete(set: IndexSet) {
        for index in set{
            list.remove(at: index)
        }
    }
}
