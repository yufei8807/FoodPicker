//
//  ContentView.swift
//  FoodPicker
//
//  Created by yufei on 2025/2/5.
//

import SwiftUI

struct ContentView: View {
    let food = Food.examples
    @State private var selectedFood: Food?
    var body: some View {
        VStack(spacing: 30) {
            Group {
                if selectedFood != .none {
                    Text(selectedFood!.image)
                        .font(.system(size: 200))
                        .minimumScaleFactor(0.1)
                        .lineLimit(1)
                } else {
                    Image("dinner")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }.frame(height: 250)
            
            Text("今天吃什么？")
                .bold()
                                    
            if selectedFood != .none {
                HStack {
                    Text(selectedFood!.name)
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.green)
                        .id(selectedFood!.name)
                        .transition(.asymmetric(
                            insertion: .opacity
                                .animation(.easeInOut(duration: 0.5).delay(0.2)),
                            removal: .opacity
                                .animation(.easeInOut(duration: 0.4))))
                    Image(systemName: "info.circle.fill")
                        .foregroundColor(.secondary)
                        .onTapGesture {
                            print("图片被点击了")
                        }
                    
                }
                
                Text("热量 \(selectedFood!.calorie.formatted()) 大卡")
                
                Grid(horizontalSpacing: 12, verticalSpacing: 12) {
                    GridRow {
                        Text("蛋白质")
                        Text("脂肪")
                        Text("碳水")
                    }
                    .frame(width: 60)
                    
                    Divider()
                        .gridCellUnsizedAxes(.horizontal)
                        .padding(.horizontal, -10)
                    
                    GridRow {
                        Text(selectedFood!.protein.formatted() + " g")
                        Text(selectedFood!.fat.formatted() + " g")
                        Text(selectedFood!.carb.formatted() + " g")
                    }
                }
                .font(.title3)
                .padding(.horizontal)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundColor(Color(.systemBackground))
                )
                
            }
            
            
            Spacer().layoutPriority(1)
 
            
            Button {
                selectedFood = food.shuffled().first{ $0 != selectedFood }
            } label: {
                Text(selectedFood == .none ? "告诉我" : "换一个")
                    .frame(width: 200)
                    .animation(.none, value: selectedFood)
                    .transformEffect(.identity)
                
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .padding(.bottom, -15)
            
            Button {
                selectedFood = .none
            } label: {
                Text("重置")
                    .frame(width: 200)
            }
           
 
        }
        .font(.title)
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.secondarySystemBackground))
        .buttonStyle(.bordered)
        .buttonBorderShape(.capsule)
        .controlSize(.large)
        .animation(.easeInOut(duration: 0.6), value: selectedFood)
        
    }
}

extension ContentView {
    init(selectedFood: Food) {
        _selectedFood = State(wrappedValue: selectedFood)
    }
}

#Preview {
    ContentView(selectedFood: .examples.first!)
}
