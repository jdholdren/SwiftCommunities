//
//  CommunityVO.swift
//  Oddesy
//
//  Created by James Holdren on 1/31/18.
//  Copyright © 2018 Anthony Kiniyalocts. All rights reserved.
//

import Foundation
import RealmSwift

struct CommunityVO {
    let loading: Bool
    var communities: Results<Community>
}

