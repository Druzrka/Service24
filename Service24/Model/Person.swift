//
//  Person.swift
//  Service24
//
//  Created by Захар on 26.09.17.
//  Copyright © 2017 Захар. All rights reserved.
//

import Foundation


class Person {
    
    private var _email: String!
    private var _token: String!
    
    var email: String {
        get {
            return _email
        } set {
            _email = newValue
        }
    }
    
    var token: String {
        get {
            return _token
        } set {
            _token = newValue
        }
    }
}



