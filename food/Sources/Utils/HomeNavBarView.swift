//
//  HomeNavBarView.swift
//  food
//
//  Created by user on 3/16/23.
//

import SwiftUI

struct HomeNavBarView: View {
    var body: some View {
        HStack {
            Image("menu").onTapGesture{}
            
            Spacer()
            
            Image("notifications").onTapGesture{
                
            }
        }
    }
}

struct HomeNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        HomeNavBarView()
    }
}
