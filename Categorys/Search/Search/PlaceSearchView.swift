//
//  PlaceSearchView.swift
//  Search
//
//  Created by 蔡志文 on 6/28/23.
//

import SwiftUI

struct PlaceSearchView: View {
  @State private var departmentId: Department.ID?
  @State private var productId: Product.ID?
  @State private var searchText: String = ""

  var body: some View {
    NavigationSplitView {
      DepartmentList(departmentId: $departmentId)
//        .searchable(text: $searchText)
    } content: {
      ProductList(departmentId: departmentId, productId: $productId)
        .searchable(text: $searchText, prompt: "Search Product")
    } detail: {
      ProductDetails(productId: productId)
    }
    // Adds a search field.
    // 默认会在 Product 中
//    .searchable(text: $searchText)
//    .searchable(text: $searchText, placement: .sidebar, prompt: "Search Product")
  }
}

#Preview {
  PlaceSearchView()
}

struct DepartmentList: View {
  @Binding var departmentId: UUID?
  let departments = Department.departments
  var body: some View {
    List(departments) { department in
      ZStack {
        Button(department.name) {
          departmentId = department.id
        }
      }
    }
    .navigationTitle("Department")
  }
}

struct ProductList: View {
  let departmentId: UUID?
  @Binding var productId: UUID?
  var products: [Product] {
    guard let departmentId else { return [] }
    return Department.departments.first { $0.id == departmentId }?.products ?? []
  }
  var body: some View {
    if products.isEmpty {
      Text("Select a department")
        .navigationTitle("Product")
    } else {
      List(products) { product in
        Button(product.name) {
          productId = product.id
        }
      }
      .navigationTitle("Product")
    }
  }
}

struct ProductDetails: View {
  var productId: UUID?
  var body: some View {
    Text("\(productId?.uuidString ?? "Select a product")")
  }
}
