//
//  ViewController.swift
//  gitTest
//
//  Created by 杜鹏 on 2017/8/25.
//  Copyright © 2017年 杜鹏. All rights reserved.
//


import UIKit
import MediaPlayer
//import AliyunPlayerSDK
import SystemConfiguration.CaptiveNetwork
import MobileCoreServices

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
      let wifi = getWifiInfo()
        print(wifi.0)
        //hello
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var test: UIButton!
    @IBAction func btn(_ sender: Any) {
        let url = URL.init(string: "app-Prefs:root=WIFI")//app-Prefs:root=WIFI
        
//        http://www.jianshu.com/p/4c64ea08012a
        
        if UIApplication.shared.canOpenURL(url!){
//             UIApplication.shared.canOpenURL(url!)
            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
        }
        
        
    }
    
    
    //获取 WiFi 信息
    func getWifiInfo() -> (ssid: String, mac: String) {
        if let cfas: NSArray = CNCopySupportedInterfaces() {
            for cfa in cfas {
                if let dict:NSDictionary = CFBridgingRetain(
                    CNCopyCurrentNetworkInfo(cfa as! CFString)
                    ) as? NSDictionary {
                    
                    if let ssid = dict["SSID"] as? String,
                        let bssid = dict["BSSID"] as? String {
                        return (ssid, bssid)
                    }
                }
            }
        }
        return ("未知", "未知")
    }
    
  
    

}

