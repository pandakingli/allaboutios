//
//  RootVC.swift
//  ProjectSwift
//
//  Created by pandakingli on 2024/3/29.
//

import UIKit
import SwiftUI


class RootVC: UIViewController {
    
    var jumpbtn: UIButton = UIButton(type: UIButton.ButtonType.custom)
    var uiMyVC : UIViewController?
    @objc func clickjumpbtn() {
        print("clickjumpbtn")
        if #available(iOS 13.0, *) {
            let uiV = mySViewOne {
                if self.uiMyVC != nil {
                    self.uiMyVC!.dismiss(animated: true)
                    self.uiMyVC = nil
                }
            }
            let vc = UIHostingController(rootView: uiV)
            vc.modalPresentationStyle = .fullScreen
            uiMyVC = vc
            
            self.present(vc, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.blue

        jumpbtn.frame = CGRect(x: 100, y: 200, width: 100, height: 60)
        jumpbtn.backgroundColor = UIColor.orange
        jumpbtn.setTitle("跳转", for: UIControl.State.normal)
        jumpbtn.addTarget(self, action: #selector(clickjumpbtn), for: UIControl.Event.touchUpInside)
        self.view.addSubview(jumpbtn)
        
    }

}
