//
//  ViewController.swift
//  Lesson19URLSession
//
//  Created by Oleksandr Muza on 08.05.2024.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func getInfoActionButton(_ sender: Any) {
        
        loadData()
    }
    
    func loadData() {
        
        let urlString = "https://reqres.in/api/unknown"
        
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        session.dataTask(with: request) { data, response, error in
            if error != nil {
//                debugPrint(error?.localizedDescription ?? "")
            } else {
                debugPrint("all fine go next!")
                
                guard let responceData = data else { return }
                
                do {
                    let result = try JSONDecoder().decode(ListResource.self, from: responceData)
                    debugPrint(result)
                } catch (let parseError) {
//                    debugPrint(parseError.localizedDescription)
                }
             }
        }.resume()
    }
}
