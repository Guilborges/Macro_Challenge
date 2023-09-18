//
//  CountComponent.swift
//  Macro_Challenge
//
//  Created by Victor Levenetz Mariano on 01/09/23.
//

import Foundation
import SwiftUI


//
//  ViewComponents.swift
//  Macro_Challenge
//
//  Created by Victor Levenetz Mariano on 14/06/23.
//

import Foundation
import SwiftUI


struct CountComponent: View {
    
    @State private var tabBarOffset: CGFloat = -40
    @State private var isTabBarHidden = false
    
    var body: some View{
        VStack {
            Spacer() // Empurra o botão para o topo da tela
            
            Button(action: {
                withAnimation {
                    isTabBarHidden.toggle()
                    if isTabBarHidden {
                        tabBarOffset =  145//
                    } else {
                        tabBarOffset = -40
                    }
                }
            }) {
                Text("Visão geral de seu brechó")
                    .frame(width: UIScreen.main.bounds.width, height: 5)
                    .foregroundColor(Color("elements"))
                    .padding()
                    .background(Color("assetBackgroundDark"))
                    .cornerRadius(10)
            }
            Spacer()
        }
        
        .padding(.bottom, tabBarOffset)
        
        .overlay(
            
            Group{
                if isTabBarHidden {
                    CountsComponents(prodVm: ProductViewModel())
                        .frame(width: 100,height: 400)
                    
                }
            }
        )
    }
}







struct CountComponent_Preview: PreviewProvider {
    
    static var previews: some View {
        CountComponent()
    }
}




struct CountsComponents: View{
    @ObservedObject var prodVm: ProductViewModel
    var body: some View{
        
        HStack{
            VStack{
                Image("iconeAdquiridoClicado")
                    .resizable()
                    .frame(width: 53, height: 53 )
                Text("\(prodVm.productsCountAcquarid())")
                    .foregroundColor(Color("title"))
                    .font(.system(size: 16, weight: .bold, design: .rounded))
                
            }
            
            VStack{
                Image("iconeLavandoClicado")
                    .resizable()
                    .frame(width: 53, height: 53 )
                Text("\(prodVm.productsCountWashing())")
                    .foregroundColor(Color("title"))
                    .font(.system(size: 16, weight: .bold, design: .rounded))
                
            }
            
            VStack{
                Image("iconeManutencaoClicado")
                    .resizable()
                    .frame(width: 53, height: 53 )
                Text("\(prodVm.productsCountMaintenance())")
                    .foregroundColor(Color("title"))
                    .font(.system(size: 16, weight: .bold, design: .rounded))
                
                
            }
            VStack{
                Image("iconeNaLojaClicado")
                    .resizable()
                    .frame(width: 53, height: 53 )
                Text("\(prodVm.productsCountSelling())")
                    .foregroundColor(Color("title"))
                    .font(.system(size: 16, weight: .bold, design: .rounded))
                
            }
            
            VStack{
                Image("iconeVendidoClicado")
                    .resizable()
                    .frame(width: 53, height: 53 )
                Text("\(prodVm.productsCountAcquarid())")
                    .foregroundColor(Color("title"))
                    .font(.system(size: 16, weight: .bold, design: .rounded))
                
            }
            
            
        }.padding(.bottom)
            .frame(width: UIScreen.main.bounds.width+10, height: 110)
            .background(Color("background"))
    }
}
