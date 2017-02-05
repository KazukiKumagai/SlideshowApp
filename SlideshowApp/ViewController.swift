//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 熊谷一騎 on 2017/02/01.
//  Copyright © 2017年 熊谷一騎. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var showButton: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var img: UIImage!
    var num: Int = 0
    let maxPhoto: Int = 5
    let photos = ["Tiger","Bear","Dog","Gorilla","Lion"]
    
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.img = UIImage(named: photos[num])
        imageView.image = self.img
        // タップを定義
        imageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(viewTap))
        self.imageView.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //スライドショー
    func slideShow(timer: Timer) {
        if num < maxPhoto-1{
            num += 1
            self.img = UIImage(named: photos[num])
        }else{
            num = 0
            self.img = UIImage(named: photos[num])
        }
        imageView.image = self.img
    }
    
    //進むボタン
    @IBAction func nextButton(_ sender: Any) {
        if num < maxPhoto-1{
            num += 1
            self.img = UIImage(named: photos[num])
        }else{
            num = 0
            self.img = UIImage(named: photos[num])
        }
        imageView.image = self.img
    }
    
    //戻るボタン
    @IBAction func prevButton(_ sender: Any) {
        if num != 0{
            num -= 1
            self.img = UIImage(named: photos[num])
        }else{
            num = maxPhoto - 1
            self.img = UIImage(named: photos[num])
        }
        imageView.image = self.img
    }
    
    //再生/停止ボタン
    @IBAction func showButton(_ sender: Any) {
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(slideShow), userInfo: nil, repeats: true)
            self.nextButton.isEnabled = false
            self.prevButton.isEnabled = false
            self.showButton.setTitle("停止", for: .normal)
        } else{
            self.timer.invalidate()
            self.timer = nil
            self.nextButton.isEnabled = true
            self.prevButton.isEnabled = true
            self.showButton.setTitle("再生", for: .normal)
        }
    }
    
    /// viewをタップされた時の処理
    func viewTap(sender: UITapGestureRecognizer){
        //スライドショーが再生されていたら止める
        if self.timer != nil{
            self.timer.invalidate()
            self.timer = nil
            self.nextButton.isEnabled = true
            self.prevButton.isEnabled = true
            self.showButton.setTitle("再生", for: .normal)
        }
        
        //値の受け渡し処理
        performSegue(withIdentifier: "segue",sender: nil)
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "next") as! nextViewController
        self.present(nextView, animated: true, completion: nil)
        
    }

    // Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "segue") {
            let nv: nextViewController = (segue.destination as? nextViewController)!
            // ViewControllerのtextVC2にメッセージを設定
            nv.nextImg = self.img
        }
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        // 他の画面から segue を使って戻ってきた時に呼ばれる
    }
    
}

