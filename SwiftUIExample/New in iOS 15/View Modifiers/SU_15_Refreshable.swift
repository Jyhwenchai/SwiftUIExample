//
//  SU_15_Refreshable.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2021/11/24.
//  Copyright © 2021 蔡志文. All rights reserved.
//

import SwiftUI

@available(iOS 15.0.0, *)
fileprivate class PhotoFetcher: ObservableObject {
    @Published fileprivate var photos: [Photo] = []
    
    func getUrls() -> [String] {
        (0...5).map { _ in
            "https://picsum.photos/id/\(Int.random(in: 1...200))/200/200"
        }
    }
    
    func loadPhotos() async {
        let uiPhotos = await fetchPhotos()
        let photos = uiPhotos.map {
            Photo(image: Image(uiImage: $0))
        }
        
        DispatchQueue.main.async {
            self.photos.append(contentsOf: photos)
        }
    }
    
    func fetchPhotos() async -> [UIImage] {
        
        let urls = getUrls()
        var images: [UIImage] = []
        await withTaskGroup(of: UIImage?.self) { group in
            for url in urls {
                group.addTask {
                    return try? await self.downloadImage(url)
                }
            }
            
            // filter download success image
            for await image in group.compactMap({ $0 }) {
                images.append(image)
            }
        }

        if images.count < urls.count {
            print("download \(urls.count - images.count) picture failed.")
        }

        return images
    }
    
    func downloadImage(_ url: String, sleepTime: UInt64 = 0) async throws -> UIImage {
        let imageUrl = URL(string: url)!
        let request = URLRequest(url: imageUrl)
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let image = UIImage(data: data), (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw NSError()
        }
        return image
    }
}


fileprivate struct Photo: Identifiable {
    let id = UUID()
    let image: Image
}

// `refreshable(action:)` 用于在列表上显示一个加载指示器，在 action 中可以执行一个异步的任务，当任务完成后会自动刷新列表数据

// `task(priority:_:)` 功能与`refreshable(action:)` 相同，只不过它是在视图显示的时候执行
@available(iOS 15.0.0, *)
struct SU_15_Refreshable: View {
    
    @StateObject fileprivate var photoFetcher = PhotoFetcher()
    
    var body: some View {
        NavigationView {
            List(photoFetcher.photos, id: \.id) { row in
                HStack {
                    row.image.frame(width: 100, height: 100, alignment: .leading).clipped()
                }.frame(width: 120, height: 120)
            }
            .navigationTitle("Photos")
            .refreshable {
                await photoFetcher.loadPhotos()
            }
            .task {
                await photoFetcher.loadPhotos()
            }
        }
    }
}

@available(iOS 15.0.0, *)
struct SU_15_Refreshable_Previews: PreviewProvider {
    static var previews: some View {
        SU_15_Refreshable()
    }
}
