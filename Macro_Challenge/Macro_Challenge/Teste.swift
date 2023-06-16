//
//  Teste.swift
//  Macro_Challenge
//
//  Created by Guilherme Borges on 06/06/23.
//

import SwiftUI

struct Teste: View {
    
    
    var productList: [Product] = [Product(tags: [Tag(name: "branco")], purchasedPrice: 250.3, status: ProductStatus.acquarid, acessory: true, image: Image(systemName: "photo")),Product(tags: [Tag(name: "branco")], purchasedPrice: 250.3, status: ProductStatus.sold, acessory: true, image: Image(systemName: "photo")),Product(tags: [Tag(name: "branco")], purchasedPrice: 250.3, status: ProductStatus.selling, acessory: true, image: Image(systemName: "photo")),Product(tags: [Tag(name: "branco"),Tag(name: "branco"),Tag(name: "branco"),Tag(name: "lelo")], purchasedPrice: 250.3, status: ProductStatus.maintenance, acessory: true, image: Image(systemName: "photo")),Product(tags: [Tag(name: "branco"),Tag(name: "branco"),Tag(name: "branco"),Tag(name: "lelo")], purchasedPrice: 250.3, status: ProductStatus.washing, acessory: true, image: Image(systemName: "photo")),Product(tags: [Tag(name: "branco"),Tag(name: "branco"),Tag(name: "branco"),Tag(name: "lelo")], purchasedPrice: 250.3, status: ProductStatus.washing, acessory: true, image: Image(systemName: "photo"))]
    
    
    var body: some View {
        
        VStack{
            Text("Total de Peças: ")
        List {
        
        
            
        
            
            ForEach(productList, id: \.self){ index in
                
                    HStack{
                        index.image
                            .resizable()
                        //.scaledToFill()
                            .frame(width:120,height: 90)
                        VStack(alignment: .leading){
                            ForEach(index.tags) { tag in
                                Text(tag.name)}
                            
                            Text("\(index.purchasedPrice,specifier: "%.2f") R$").frame(width: 90)
                        }
                        Spacer()
                        Button {
                            print("ssss")
                        } label: {
                            Circle()
                            switch index.status{
                            case ProductStatus.acquarid: ButtonCircleYellow().position(x:80,y:20)
                            case ProductStatus.sold: ButtonCircleGreen().position(x:80,y:20)
                            case ProductStatus.maintenance: ButtonCircleOrange().position(x:80,y:20)
                            case ProductStatus.selling: ButtonCirclePurple().position(x:80,y:20)
                            case ProductStatus.washing: ButtonCircleBlue().position(x:80,y:20)
                                
                            default: Circle()
                                    .frame(width: 20)
                                    .foregroundColor(.blue)
                                    
                            }
                            
                        }
                    
                }
            }
            }
        }.frame(maxWidth: .infinity, alignment: .center)
    }
}

struct Teste_Previews: PreviewProvider {
    static var previews: some View {
        Teste()
    }
}
