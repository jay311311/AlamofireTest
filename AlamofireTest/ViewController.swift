//
//  ViewController.swift
//  AlamofireTest
//
//  Created by pineone on 2022/07/18.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchDataPath()
    }
    
    func fetchDataBasic(){
        let  request = AF.request("https://api.itbook.store/1.0/new" )
        request.validate(statusCode: 200..<500)
        .responseDecodable(of:NewBook.self) { data in
            switch data.result{
            case .success:
                print("\(String(describing: data.value))")
            case .failure(_):
                print("\(String(describing: data.error?.errorDescription))")
            }
        }
    
    }
    
    func fetchDataPath(_ isbn :String = "1001656317756"){
        let  baseURL =  URL(string: "https://api.itbook.store/1.0/books")!
        let url = baseURL.appendingPathComponent(isbn)
        let request  =  AF.request(url)
        request.validate(statusCode: 200..<500)
        .responseDecodable(of:DetailBook.self) { data in
            switch data.result{
            case .success:
                print("detail : \(String(describing: data.value))")
            case .failure(_):
                print("detail : \(String(describing: data.error?.errorDescription))")
            }
        }
    }


}



