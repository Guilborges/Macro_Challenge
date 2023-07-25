//
//  TabScreen1.swift
//  Macro_Challenge
//
//  Created by Victor Levenetz Mariano on 25/07/23.
//

import Foundation
//
//  TelaInicial.swift
//  Macro_Challenge
//
//  Created by Guilherme Borges on 06/06/23.
//

import SwiftUI

struct TabScreen1: View {
    @State private var tags: [Tag] = []
    @State var imagePicker = ImagePicker()
    @State var imagepicker1 = Image(systemName: "")
    
    @ObservedObject var prodVm: ProductViewModel
    
   @State var setIndexProduct: Int = 0
   
    
    @State private var showingSheet = false
  //  @Environment(\.dismiss) var dismiss
    var body: some View {
        
            NavigationStack {
                
                VStack(alignment: .leading) {
                    Text("Meu Brechó")
                        .bold()
                        .font(.system(size: 34, weight: .bold, design: .rounded))
                        .padding(25)
                    Text("Total de Peças: \(prodVm.productsCount())")
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    
                    List{
                        ForEach(Array(prodVm.productList.enumerated()), id: \.offset) { index, element in
                            ForEach(element.tags) { tag in
                                Text(tag.name)}
                            HStack{
                                element.image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:120,height: 90)
                                VStack(alignment: .leading){
                                    ForEach(index.tags) { tag in
                                        Text(tag.name)}
                                    
                                    Text("\(element.purchasedPrice,specifier: "%.2f") R$").frame(width: 90)
                                }
                                Button {
                                    setIndexProduct = index
                                    showingSheet.toggle()
                                    
                                    
                                } label: {
                                    // Circle()
                                    switch element.status{
                                    case ProductStatus.acquarid: ButtonCircleYellow().position(x:60,y:20)
                                    case ProductStatus.sold: ButtonCircleGreen().position(x:60,y:20)
                                    case ProductStatus.maintenance: ButtonCircleOrange().position(x:60,y:20)
                                    case ProductStatus.selling: ButtonCirclePurple().position(x:60,y:20)
                                    case ProductStatus.washing: ButtonCircleBlue().position(x:60,y:20)
                                        
                                    default: Circle()
                                            .frame(width: 20)
                                            .foregroundColor(.blue)
                                        
                                    }
                                }
                            }
                            
                            ForEach(prodVm.productList, id: \.self){ index in
                                
                                HStack{
                                    index.image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width:120,height: 90)
                                    VStack(alignment: .leading){
                                        ForEach(index.tags) { tag in
                                            Text(tag.name)}
                                        
                                        Text("\(index.purchasedPrice,specifier: "%.2f") R$").frame(width: 90)
                                    }
                                    Button {
                                        
                                       // showingSheet.toggle()
                                        
                                        
                                    } label: {
                                        // Circle()
                                        switch index.status{
                                        case ProductStatus.acquarid: ButtonCircleYellow().position(x:60,y:20)
                                        case ProductStatus.sold: ButtonCircleGreen().position(x:60,y:20)
                                        case ProductStatus.maintenance: ButtonCircleOrange().position(x:60,y:20)
                                        case ProductStatus.selling: ButtonCirclePurple().position(x:60,y:20)
                                        case ProductStatus.washing: ButtonCircleBlue().position(x:60,y:20)
                                            
                                        default: Circle()
                                                .frame(width: 20)
                                                .foregroundColor(.blue)
                                            
                                        }
                                        
                                        
                                        
                                        
                                    }.sheet(isPresented: $showingSheet) {
                                        VStack{
                                            Button("Adquirido") {
                                                //   dismiss()
                                                showingSheet.toggle()
                                                prodVm.trocarEnum(objeto: prodVm.productList[setIndexProduct], novoEnum: .acquarid)
                                                prodVm.printalista1()
                                                print(index)
                                                
                                                
                                                
                                            }
                                            .font(.title)
                                            .padding()
                                            Button("Lavando") {
                                                //   dismiss()
                                                showingSheet.toggle()
                                                prodVm.trocarEnum(objeto: index, novoEnum: .washing)
                                                prodVm.printalista1()
                                                
                                            }
                                            .font(.title)
                                            .padding()
                                            Button("Manutenção") {
                                                //   dismiss()
                                                showingSheet.toggle()
                                                prodVm.trocarEnum(objeto: index, novoEnum: .maintenance)
                                                prodVm.printalista1()
                                                
                                            }
                                            .font(.title)
                                            .padding()
                                            Button("Em loja") {
                                                //   dismiss()
                                                showingSheet.toggle()
                                                prodVm.trocarEnum(objeto: index, novoEnum: .selling)
                                                prodVm.printalista1()
                                                
                                            }
                                            .font(.title)
                                            .padding()
                                            Button("Vendido") {
                                                //   dismiss()
                                                showingSheet.toggle()
                                                prodVm.trocarEnum(objeto: index, novoEnum: .sold)
                                                prodVm.printalista1()
                                                updateStatus(for: index, statuss: 4)
                                            }
                                            .font(.title)
                                            .padding()
                                            
                                        }
                                    }
                                }
                            }
                            
                            .onDelete(perform: prodVm.deleteProduct)
                            
                            
                        }
                        
                        
                    }
                    
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            NavigationLink(destination: ContentView(prod: prodVm, tags: $tags)) {
                                Image(systemName: "plus")
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                    .padding()
                    
                    
                }
                .navigationViewStyle(.stack)
                .frame(maxWidth: .infinity)
                
            }
            
            .navigationBarHidden(true)
            
            
        }
        
    func updateStatus(for product: Product, statuss: Int) {
        
            switch statuss{
            case 1:
                product.status =  .washing
            case 2:
                product.status =  .maintenance
            case 3:
                product.status =  .selling
            case 4:
                product.status =  .acquarid
            case 5:
                product.status =  .sold
            
            default:
                product.status =  .nullo
            
            }
        }
    func fetchProduto() {
           let fetchRequest: NSFetchRequest<Product> = Product.fetchRequest()
           do {
               produto = try CoreDataManager.shared.persistentContainer.viewContext.fetch(fetchRequest)
           } catch {
               fatalError("Erro ao buscar produtos: \(error)")
           }
       }

       func salvarProduto() {
           // Aqui eu acredito que pode adicionar nossos produtos ao vetor 'produto'
           // Aqui eu acredito que colocariamos nosso produto, mas n sei ao certo se seria assim
           //produto.append(novoProduto)

           CoreDataManager.shared.saveContext()
       }
    
    //ai esse novoProduto seria uma nova variavel que passaria o core como contexto, pelo exemplo que vi, seria tipo isso
    //let newProduct = Product(context: CoreDataManager.shared.persistentContainer.viewContext)
   // newProduct.name = "Nome do produto"
   // newProduct.price = 9.99
    // ai colocaria outros atributos se tiver

    CoreDataManager.shared.saveContext() // Aqui salva o contextolet newProduct = Product(context: CoreDataManager.shared.persistentContainer.viewContext)
    newProduct.name = "Nome do produto"
    newProduct.price = 9.99
    // Atribua outros atributos, se houver

    CoreDataManager.shared.saveContext() // Salve o contexto após adicionar o produto após adicionar o produto
    
    
    }
    
    
    
    
    



//



