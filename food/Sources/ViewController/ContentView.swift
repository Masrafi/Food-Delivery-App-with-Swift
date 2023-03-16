//
//  ContentView.swift
//  food
//
//  Created by Abu Anwar MD Abdullah on 25/1/21.
//

import SwiftUI

struct ContentView: View {
    @State private var search: String = ""
    @State var showSearch: Bool = false
    var body: some View {
        NavigationView {
            ScrollView {
                VStack (alignment: .leading, spacing: 16 ){
                    HomeNavBarView()
                    
                    Text("Bonjour, Emma").font(.caption).fontWeight(.medium).foregroundColor(Color("GrayColor"))
                    Text("What would you like to cook today?").font(.title).fontWeight(.bold)
                    
                    SearchAndFilterView(search:  $search)
                    
                    SectionTabTitleView(title: "Today's Fresh Recipes")
                    
                   
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        HStack (spacing: 16){
                            
                            NavigationLink(destination:  SecondScreen(searchedText: "French Toast with Berries", image: UIImage(imageLiteralResourceName: "fresh_recipe_1")), label: {
                                BigRecipeCardView(image: UIImage(imageLiteralResourceName: "fresh_recipe_1"), title: "French Toast with Berries")
                            }).navigationBarHidden(true).foregroundColor(.black)
                            
                            NavigationLink(destination:  SecondScreen(searchedText: "Chicken Burger with Cocoacola", image: UIImage(imageLiteralResourceName: "fresh_recipe_2")), label: {
                                BigRecipeCardView(image:  UIImage(imageLiteralResourceName: "fresh_recipe_2"), title: "Chicken Burger with Cocoacola")
                            }).navigationBarHidden(true).foregroundColor(.black)
                            
                            NavigationLink(destination:  SecondScreen(searchedText: "Vegiatable Burger with Cocoacola", image: UIImage(imageLiteralResourceName: "fresh_recipe_2")), label: {
                                BigRecipeCardView(image:  UIImage(imageLiteralResourceName: "fresh_recipe_2"), title: "Vegiatable Burger with Cocoacola")
                            }).navigationBarHidden(true).foregroundColor(.black)
                           
                        }
                    }
                    
                    SectionTabTitleView(title: "Recommended")
                    
                    
                    NavigationLink(destination:  SecondScreen(searchedText: "Paratha – Popular Bangladesh", image: UIImage(imageLiteralResourceName: "reco_1")), label: {
                        SmallRecipeCardView(image: UIImage(imageLiteralResourceName: "reco_1"), title: "Paratha – Popular Bangladesh")
                    }).navigationBarHidden(true).foregroundColor(.black)
                    NavigationLink(destination:  SecondScreen(searchedText: "Kachchi Biryani – A special", image: UIImage(imageLiteralResourceName: "reco_2")), label: {
                        SmallRecipeCardView(image: UIImage(imageLiteralResourceName: "reco_2"), title: "Kachchi Biryani – A special")
                    }).navigationBarHidden(true).foregroundColor(.black)
                    NavigationLink(destination:  SecondScreen(searchedText: "Bhuna Khichuri – A special", image: UIImage(imageLiteralResourceName: "reco_3")), label: {
                        SmallRecipeCardView(image: UIImage(imageLiteralResourceName: "reco_3"), title: "Bhuna Khichuri – A special")
                    }).navigationBarHidden(true).foregroundColor(.black)
                   
                   
                    
                    
                    
                   // Spacer()
                    
                    
                }.padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SectionTabTitleView: View {
    let title: String
    var body: some View {
        HStack {
            Text(title).font(.title2).fontWeight(.bold)
            Spacer( )
            Text("See All").foregroundColor(Color("PrimaryColor")).onTapGesture {
                
            }
        }
    }
}

struct SearchAndFilterView: View {
    @Binding var search: String
    var body: some View {
        HStack (spacing: 16) {
            HStack {
                Image("search")
                TextField("Search For Recips", text: $search)
            }.padding().background(Color("LightGrayColor")).cornerRadius(8.0)
            
            Image("filter").padding().background(Color("LightGrayColor")).cornerRadius(8.0).onTapGesture {
                
            }
        }
    }
}



struct BigRecipeCardView: View {
    let image: UIImage
    var title: String
    var body: some View {
        ZStack {
            VStack (alignment: .leading, spacing: 8){
                Image("like").padding(.bottom, 60)
                Text("Breakfast").font(.caption).foregroundColor(Color.blue)
                
                Text(title).fontWeight(.medium)
                
               
                HStack (spacing: 2) {
                    ForEach(0 ..< 5) {
                        item in
                        Image("star").renderingMode(.template).foregroundColor(Color("PrimaryColor"))
                    }
                }
                Text("120 Calories").font(.caption).foregroundColor(Color("PrimaryColor"))
                
                HStack {
                    Image("time")
                    Text("10 mins").font(.caption2).foregroundColor(Color("GrayColor"))
                    
                    Image("serving")
                    Text("1 Serving").font(.caption2).foregroundColor(Color("GrayColor"))
                }
            }.frame(width: 147).padding().background(Color("LightGrayColor")).cornerRadius(20.0)
            
            Image(uiImage: image).offset(x: 45, y: -60)
        }.padding(.trailing, 25)
    }
}


struct SmallRecipeCardView: View {
    let image: UIImage
    let title: String
    var body: some View {
        HStack {
            Image(uiImage: image).aspectRatio(1, contentMode: .fill)
            VStack (alignment: .leading, spacing: 4) {
                Text("Breakfast").font(.caption).foregroundColor(Color.blue)
                
                Text(title).fontWeight(.medium)
                
               
                HStack (spacing: 2) {
                    ForEach(0 ..< 5) {
                        item in
                        Image("star").renderingMode(.template).foregroundColor(Color("PrimaryColor"))
                    }
                    Text("120 Calories").font(.caption).foregroundColor(Color("PrimaryColor")).padding(.leading)
                }
                
                
                HStack {
                    Image("time")
                    Text("10 mins").font(.caption2).foregroundColor(Color("GrayColor"))
                    
                    Image("serving")
                    Text("1 Serving").font(.caption2).foregroundColor(Color("GrayColor"))
                    Spacer()
                }
            }
        }.padding().frame(maxWidth: .infinity).background(Color("LightGrayColor")).cornerRadius(18.0)
    }
}
