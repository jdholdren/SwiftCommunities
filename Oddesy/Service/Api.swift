//
//  Api.swift
//  Oddesy
//
//  Created by Anthony Kiniyalocts on 1/18/18.
//  Copyright © 2018 Anthony Kiniyalocts. All rights reserved.
//

import Foundation
import Alamofire
import RealmSwift
import RxSwift

public struct Base {
    static let index = "/index.json"
}

protocol BatteriiApi {
    func fetchIndex(name: String) -> Observable<Bool>
}

class Api : BatteriiApi{
    
    let decoder: JSONDecoder
    
    init(){
        self.decoder = JSONDecoder()
    }

    func fetchIndex(name: String) -> Observable<Bool> {
        return Observable.create { observer in
            let trimmedName = name.trimmingCharacters(in: .whitespaces)
            
            let url = "https://" + trimmedName + ".batterii.com" + Base.index
            
            Alamofire.request(url).validate().responseData { dataResponse in
                
                do{
                    let indexResponse = try self.decoder.decode(IndexResponse.self, from: dataResponse.data!)
                    
                    let realm = try! Realm()
                    
                    try! realm.write {
                        realm.add(indexResponse.community, update: true)
                    }
                    
                    observer.onNext(true)
                    observer.onCompleted()
                }catch let error{
                    observer.onError(error)
                }
            }
            
            return Disposables.create()
        }
    }
 
}
