//
// Created by Anthony Kiniyalocts on 1/26/18.
// Copyright (c) 2018 Anthony Kiniyalocts. All rights reserved.
//

import Foundation
import RxSwift

class MockApiService : BatteriiApi{
    
    
    func fetchIndex(name: String) -> Observable<Bool> {
        return Observable.create { observer in
            return Disposables.create()
        }
    }
    

    var isCommunityFetchCalled = false
    var fetchedCommunity : Community?
    var completeClosure : ((Bool, NSError?) -> ())!

    func fetchIndex(name: String, complete: @escaping (Bool, NSError?) -> ()) {
        isCommunityFetchCalled = true
        completeClosure = complete
    }

    func fetchSuccess(){
        completeClosure(true, nil)
    }

    func fetchFail(error:NSError?){
        completeClosure(false, error)
    }
}
