//
//  CSInfiniteScrollView.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2021/12/27.
//  Copyright © 2021 蔡志文. All rights reserved.
//

import SwiftUI

struct CSInfiniteScrollView: View {
    
    @StateObject fileprivate var listData = GetData()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(Array(listData.data.enumerated()), id: \.element) { index, doc in
                    CellView(doc: doc, isLast: index == listData.data.count - 1, listData: listData)
                }
                if listData.isLoading {
                    Text("loading...")
                }
            }
            .navigationBarTitle("Home")
        }
        .navigationViewStyle(.stack)
        .onAppear {
            listData.updateData()
        }
    }
}

private struct CellView: View {
    
    var doc: Doc
    var isLast: Bool
    @StateObject fileprivate var listData: GetData
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(doc.id).fontWeight(.bold)
            Text(doc.eissn)
            Text(doc.article_type)
            Text(doc.publication_date).font(.caption)
                .onAppear {
                    if isLast {
                        listData.updateData()
                    }
                }
        }
        .padding(.top, 10)
    }
}

struct CSInfiniteScrollView_Previews: PreviewProvider {
    static var previews: some View {
        CSInfiniteScrollView()
    }
}

fileprivate class GetData: ObservableObject {
    @Published var data = [Doc]()
    @Published var count = 1
    @Published var isLoading: Bool = false
    
    func updateData() {
        if count >= 50 {
            return
        }
        guard let url = URL(string: "https://api.plos.org/search?q=title:%22Food%22&start=\(count)&rows=10") else {
            print("Request URL  unavailable.")
            return
        }
        
        isLoading = true
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { data, response, error in
            if let error = error {
                self.isLoading = false
                print(error.localizedDescription)
                return
            }
            
            do {
                let detail = try JSONDecoder().decode(Detail.self, from: data!)
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        defer { self.isLoading = false }
                        if detail.response.docs.isEmpty {
                            return
                        }
                        self.data = self.data + detail.response.docs
                        self.count += 10
                }
            } catch {
                DispatchQueue.main.async {
                    self.isLoading = false
                    print(error.localizedDescription)
                }
            }
        }
        .resume()
    }
}

private struct Detail: Decodable {
    var response: Response
}

private struct Response: Decodable {
    var docs: [Doc]
}

private struct Doc: Decodable, Identifiable, Hashable {
    var id: String
    var journal: String
    var eissn: String
    var publication_date: String
    var article_type: String
}
