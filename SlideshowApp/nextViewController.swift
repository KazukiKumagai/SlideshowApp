//
//  nextViewController.swift
//  SlideshowApp
//
//  Created by 熊谷一騎 on 2017/02/04.
//  Copyright © 2017年 熊谷一騎. All rights reserved.
//

import UIKit

class nextViewController: UIViewController {

    @IBOutlet weak var iv: UIImageView!
    var nextImg: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //拡大して表示
        iv.transform = CGAffineTransform(scaleX: 1.5, y: 1.5);
        iv.image = self.nextImg
        
        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
