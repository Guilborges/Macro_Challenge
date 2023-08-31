//
//  Triangle.swift
//  Macro_Challenge
//
//  Created by Victor Levenetz Mariano on 31/08/23.
//

import Foundation
import SwiftUI


struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.width
        let height = rect.height
        
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: width, y: 0))
        path.addLine(to: CGPoint(x: width, y: height))
        
        return path
    }
}

struct TriangleColor: View {
    let product: Product
    
    var body: some View {
        
        switch product.status{
        case ProductStatus.acquarid: Triangle()
                .fill(Color("triangleAcquarid"))
                .frame(width: 60, height: 60)
                .position(x: 75, y: 16)
                .cornerRadius(10)
                .rotationEffect(Angle(degrees: -90))
        case ProductStatus.sold: Triangle()
                .fill(Color("triangleSold"))
                .frame(width: 60, height: 60)
                .position(x: 75, y: 16)
                .cornerRadius(10)
                .rotationEffect(Angle(degrees: -90))
        case ProductStatus.maintenance: Triangle()
                .fill(Color("triangleMaintenance"))
                .frame(width: 60, height: 60)
                .position(x: 75, y: 16)
                .cornerRadius(10)
                .rotationEffect(Angle(degrees: -90))
                .opacity(200)
        case ProductStatus.selling: Triangle()
                .fill(Color("triangleSelling"))
                .frame(width: 60, height: 60)
                .position(x: 75, y: 16)
                .cornerRadius(10)
                .rotationEffect(Angle(degrees: -90))
        case ProductStatus.washing: Triangle()
                .fill(Color("triangleWashing"))
                .frame(width: 60, height: 60)
                .position(x: 75, y: 16)
                .cornerRadius(10)
                .rotationEffect(Angle(degrees: -90))
            
            
        default: Circle()
                .frame(width: 20)
                .foregroundColor(.blue)
            
        }
    }
}

