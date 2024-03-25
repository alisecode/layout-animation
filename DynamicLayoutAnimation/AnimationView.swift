//
//  AnimationView.swift
//  DynamicLayoutAnimation
//
//  Created by Alisa Serhiienko on 25.03.2024.
//

import SwiftUI

enum ItemSizes {
    case min(CGFloat)
    case max(CGFloat)
    
    mutating func next() {
        switch self {
        case .min:
            self = .max(150)
        case .max:
            self = .min(200)
        }
    }
    
    var newSize: CGFloat {
        switch self {
        case .min(let newSize),
                .max(let newSize):
            return newSize
        }
    }
    
    var isMax: Bool {
        switch self {
        case .max:
            return true
        default:
            return false
        }
    }
}


struct LayoutAnimation: View {
    @Binding var minSize: CGFloat
    @Binding var maxSize: CGFloat
    
    @State var animationState: ItemSizes = .min(160)
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 2, style: .circular)
                .frame(width: 40, height: 24)
                .foregroundStyle(.gray.opacity(0.5))
           
            
            Rectangle()
                .frame(width: 3, height: 24)
                .offset(y: animationState.isMax ? 0 : 24)
            
            
            Rectangle()
                .frame(width: 40, height: 3)
                .offset(x: animationState.isMax ? 0 : 40)
        }
        .clipped()
        .foregroundStyle(.black)
        .onTapGesture {
            withAnimation {
                animationState.next()
                if minSize == 160 {
                    minSize = 200
                } else {
                    minSize = 160
                    maxSize = 188
                }
            }
        }
    }
}



#Preview {
    LayoutAnimation(minSize: .constant(160), maxSize: .constant(160))
}
