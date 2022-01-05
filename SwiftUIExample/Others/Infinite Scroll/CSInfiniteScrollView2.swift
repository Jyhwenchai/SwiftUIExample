//
//  CSInfiniteScrollView2.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2021/12/30.
//  Copyright © 2021 蔡志文. All rights reserved.
//

import SwiftUI

@available(iOS 15.0.0, *)
struct CSInfiniteScrollView2: View {

    @StateObject fileprivate var listData = GetData()

    @State var requestPageNumber: Int = 0
    
    init() {
        UIRefreshControl.appearance().attributedTitle = NSAttributedString(string: "loading...")
        UIRefreshControl.appearance().tintColor = .systemBlue
    }
    
    var body: some View {
        NavigationView {
            
            List(listData.data.indices, id: \.self) { index in
                let doc = listData.data[index]
                CellView(doc: doc)
                    .onAppear {
                        if shouldLoadMore(at: index) {
                            requestPageNumber += 1
                            print("pull down loading data")
                            Task {
                                await loadData()
                            }
                        }
                    }
               
                if listData.isLoading && shouldLoadMore(at: index) {
                    ProgressView("loading...")
                        .progressViewStyle(.circular)
                        .frame(maxWidth: .infinity)
                        .padding()
                }
            }
            .refreshable {
                print("pull down to refresh data")
                requestPageNumber = 0
                await loadData()
            }
            .onAppear {
                print("first load data")
                Task {
                    await loadData()
                }
            }
            .navigationTitle("List")
            .navigationBarTitleDisplayMode(.inline)
//            .listRowInsets(.none)
            .listStyle(.plain)
        }
        .navigationViewStyle(.stack)
        
    }
    
    func loadData() async {
        do {
            try await listData.loadData(with: requestPageNumber)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func shouldLoadMore(at index: Int) -> Bool {
//        print("data count: \(listData.data.count) current index: \(index)")
       return listData.data.count - 1 == index
    }
}

@available(iOS 15.0.0, *)
struct CSInfiniteScrollView2_Previews: PreviewProvider {
    static var previews: some View {
        CSInfiniteScrollView2()
    }
}

private struct CellView: View {

    var doc: Doc

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(doc.id).fontWeight(.bold)
            Text(doc.eissn)
            Text(doc.article_type)
            Text(doc.publication_date).font(.caption)
        }
        .padding(.top, 10)
    }
}

@MainActor
@available(iOS 15.0.0, *)
fileprivate class GetData: ObservableObject {
    
    @Published var data = [Doc]()
    @Published var isLoading: Bool = false

    nonisolated func loadData(with page: Int) async throws {
        let numberOfRows = max(1, page * 10)
        if numberOfRows >= 50 {
            return
        }
        guard let url = URL(string: "https://api.plos.org/search?q=title:%22Food%22&start=\(numberOfRows)&rows=15") else {
            throw "Request URL  unavailable."
        }
        
        await MainActor.run {
            isLoading = true
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw "Request failed."
        }
        
        
        let detail = try JSONDecoder().decode(Detail.self, from: data)
        if detail.response.docs.isEmpty {
            return
        }
        
        sleep(2)
       
        
        await MainActor.run {
            if page == 0 {
                self.data = detail.response.docs
            } else {
                self.data = self.data + detail.response.docs
            }
            isLoading = false
        }
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

extension String: LocalizedError {
    public var errorDescription: String? { self }
}
