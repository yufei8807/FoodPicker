//
//  ContentView.swift
//  FoodPicker
//
//  Created by yufei on 2025/2/5.
//

import SwiftUI

struct ContentView: View {
    let food = ["汉堡","沙拉","披萨","意大利面","鸡腿便当","刀削面","火锅"]
    @State private var selectedFood: String?
    var body: some View {
        VStack(spacing: 30) {
            Image("dinner")
                .resizable()
                .aspectRatio(contentMode: .fit)
                
                
            Text("今天吃什么？")
                .bold()
            
            if selectedFood != .none {
                Text(selectedFood ?? "")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.green)
            }
            
            Button(role: .none) {
                selectedFood = food.shuffled().first
            } label: {
                Text(selectedFood == .none ? "告诉我！" : "换一个")
                    .frame(width: 200)
                
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .padding(.bottom, -15)
            
            Button(role: .none) {
                selectedFood = .none
            } label: {
                Text("重置")
                    .frame(width: 200)
            }
           
 
        }
        .font(.title)
        .padding()
        .frame(maxHeight: .infinity)
        .background(Color(.secondarySystemBackground))
        .buttonStyle(.bordered)
        .buttonBorderShape(.capsule)
        .controlSize(.large)
        .animation(.easeInOut, value: selectedFood)
        
    }
}

#Preview {
    ContentView()
}
