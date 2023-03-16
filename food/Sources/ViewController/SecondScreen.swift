//
//  SecondScreen.swift
//  food
//
//  Created by user on 3/16/23.
//

import SwiftUI

struct SecondScreen: View {
    @Environment(\.presentationMode) var presentationMode
    // @Binding is used when variables need to be passed between 2 views
    var searchedText: String
    let image: UIImage
    var body: some View {
        VStack {
            Text(self.searchedText).font(.title)
            
            Image(uiImage: self.image)
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
          
        }.edgesIgnoringSafeArea(.bottom).navigationBarBackButtonHidden(true).navigationBarItems(leading:
                                                                                                    Button(action: {
                                                                                                                   self.presentationMode.wrappedValue.dismiss()
           }) {
               Image(systemName: "chevron.backward")
           }
                                                                                                    , trailing: Image("threeDot")).padding(.all, 12).background(Color.white).cornerRadius(8.0)
       
    }
}

struct SecondScreen_Previews: PreviewProvider {
    // when using @Binding, @State static must be used to show preview
    //@State static var searchedText: String = ""
    static var previews: some View {
        SecondScreen(searchedText: "", image: UIImage(imageLiteralResourceName: ""))
    }
}
