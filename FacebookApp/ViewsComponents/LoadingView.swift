//
//  LoadingView.swift
//  FacebookApp
//
//  Created by youssef shaban on 10/05/2021.
//

import SwiftUI

struct LoadingView: View {
    @State private var progress = 0.5
    var body: some View {
        
        ProgressView(value: progress) .progressViewStyle(CircularProgressViewStyle())
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
