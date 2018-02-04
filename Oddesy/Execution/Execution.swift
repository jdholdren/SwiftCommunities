//
//  Execution.swift
//  Oddesy
//
//  Created by James Holdren on 2/2/18.
//  Copyright © 2018 Anthony Kiniyalocts. All rights reserved.
//

import Foundation
import RxSwift

protocol ExecutionWrapper {
    func wrap<T>(obs: Observable<T>) -> Observable<T>
}

class SchedulerWrapper: ExecutionWrapper {
    
    static let instance = SchedulerWrapper()
    
    func wrap<T>(obs: Observable<T>) -> Observable<T> {
        return obs
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
    }
}
