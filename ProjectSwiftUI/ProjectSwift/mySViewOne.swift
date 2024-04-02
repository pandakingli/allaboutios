//
//  mySViewOne.swift
//  ProjectSwift
//
//  Created by pandakingli on 2024/4/1.
//

import SwiftUI

struct mySViewOne: View {
    var dismissmySViewOne:()->()?

    @available(iOS 13.0, *)
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Button("返回") {
            print("点击返回")
            dismissmySViewOne()
        }
    }
}

#Preview {
    mySViewOne {
        
    }
}
