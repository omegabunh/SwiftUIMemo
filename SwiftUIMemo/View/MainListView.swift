//
//  MainListView.swift
//  SwiftUIMemo
//
//  Created by 박성우 on 2022/12/06.
//

import SwiftUI

struct MainListView: View {
    @EnvironmentObject var store: MemoStore

    @State private var showComposer: Bool = false
    
    @State var searchText = ""
    
    var filterMemo: [Memo]{
        if searchText.isEmpty {
            return store.list
            } else {
                return store.list.filter { $0.content.localizedStandardContains(searchText) }
            }
    }
    
    var body: some View {
        NavigationView {
            List{
                ForEach(filterMemo) { memo in
                    NavigationLink {
                        DetailView(memo: memo)
                    } label: {
                        MemoCell(memo: memo)
                    }
                }
                    .onDelete(perform: store.delete)
            }
                .listStyle(.plain)
                .navigationTitle("메모")
                .toolbar {
                Button {
                    showComposer = true
                } label: {
                    Image(systemName: "plus")
                }
            }
                .sheet(isPresented: $showComposer) {
                ComposeView()
            }
        }.searchable(text: $searchText,
                     placement: .navigationBarDrawer,
                     prompt: "검색")
    }

}

struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
            .environmentObject(MemoStore())
    }
}


