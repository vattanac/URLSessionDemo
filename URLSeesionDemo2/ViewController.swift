//
//  ViewController.swift
//  URLSeesionDemo2
//
//  Created by Vattanac on 12/13/18.
//  Copyright © 2018 vattanac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "http://api-ams.me/v1/api/articles?page=1&limit=15")
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
           // print(data)
            
            let d = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
            let i = d as! [String:Any]
            var aritcles = i["DATA"] as! NSArray//[[String:Any]]
            for article in aritcles {
                var adata = article as! [String:Any]
                print(adata["TITLE"]!)
            }
        
        }
        task.resume()
    }


}

