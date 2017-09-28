//
//  Car.swift
//  Service24
//
//  Created by Захар on 26.09.17.
//  Copyright © 2017 Захар. All rights reserved.
//

import Foundation


class Car {
    
    private var _id: Int64!
    private var _model: String!
    private var _mark: String!
    private var _vinCode: String!
    private var _number: String!
    
    init(id: Int64, model: String, mark: String, vinCode: String, number: String) {
        _id = id
        _model = model
        _mark = mark
        _vinCode = vinCode
        _number = number
    }
    
    var id: Int64 {
        get {
            return _id
        } set {
            _id = newValue
        }
    }
    
    var model: String {
        get {
            return _model
        } set {
            _model = newValue
        }
    }
    
    var mark: String {
        get {
            return _mark
        } set {
            _mark = newValue
        }
    }
    
    var vinCode: String {
        get {
            return _vinCode
        } set {
            _vinCode = newValue
        }
    }
    
    var number: String {
        get {
            return _number
        } set {
            _number = newValue
        }
    }
}





