//
//  ContentView.swift
//  DynamicLayoutAnimation
//
//  Created by Alisa Serhiienko on 25.03.2024.
//

import SwiftUI

struct ContentView: View {
    @State var minSize: CGFloat = 160
    @State var maxSize: CGFloat = 188
    let images = ["pic1", "pic2", "pic3", "pic4", "pic5", "pic6", "pic7", "pic8", "pic9", "pic10"]
    
    var body: some View {
        ScrollView {
            HStack(spacing: 0) {
                
                Text("Album")
                    .font(.system(size: 24, weight: .medium))
                
                Spacer()
                
                LayoutAnimation(minSize: $minSize, maxSize: $maxSize)
                    .frame(width: .infinity, alignment: .trailing)
                    .padding(.horizontal)
            }
            .padding(.horizontal, 8)
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: minSize), spacing: 8)], spacing: 8) {
                ForEach(images, id: \.self) { image in
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal, 8)
        }
      .scrollIndicators(.hidden)
        
    }
}

#Preview {
    ContentView()
}
