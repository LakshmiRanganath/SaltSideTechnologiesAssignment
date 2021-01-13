//
//  SaltsideLinkNode.swift
//  SaltSideTechnologiesAssignment
//
//  Created by Lakshmi Ranganatha Hema on 1/13/21.
//

import Foundation

class SaltsideLinkNode<K,V> {
    var key: K
    var value: V
    var next: SaltsideLinkNode?
    var prev: SaltsideLinkNode?
    
    init(_ key: K, _ value: V) {
        self.key = key
        self.value = value
    }
}
