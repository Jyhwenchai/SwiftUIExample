//
//  ContentView.swift
//  ch004_CoreLocationUI_Async_Await
//
//  Created by 蔡志文 on 2022/4/26.
//

import SwiftUI
import CoreLocationUI
import CoreLocation
import MapKit

struct ContentView: View {
    
    @StateObject var locationManaager = LocationManager()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            
            Map(coordinateRegion: $locationManaager.region, showsUserLocation: true, annotationItems: locationManaager.coffeeShops) { shop in
                MapMarker(coordinate: shop.mapItem.placemark.coordinate, tint: .purple)
            }
            
            LocationButton(.currentLocation) {
                locationManaager.manager.requestLocation()
            }
            .symbolVariant(.fill)
            .foregroundColor(.white)
            .tint(.purple)
            .clipShape(Capsule())
            .padding()
        }
        .overlay (
            Text("Coffee Shop's")
                .font(.title.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(.ultraThinMaterial)
            , alignment: .top
        )

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var manager = CLLocationManager()
    
    @Published var region: MKCoordinateRegion = .init()
    
    @Published var coffeeShops: [Shop] = []
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last?.coordinate else { return }
        region = MKCoordinateRegion(center: location, latitudinalMeters: 1000, longitudinalMeters: 1000)
        Task {
            await fetchCoffeeShops()
        }
    }
    
    func fetchCoffeeShops() async {
        do {
            let request = MKLocalSearch.Request()
            request.region = region
            request.naturalLanguageQuery = "Coffee Shops"
            let query = MKLocalSearch(request: request)
            let response = try await query.start()
            await MainActor.run(body: {
                coffeeShops = response.mapItems.compactMap { item in
                    return Shop(mapItem: item)
                }
            })
            
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct Shop: Identifiable {
    var id = UUID().uuidString
    var mapItem: MKMapItem
}
