//
//  LoginModel.swift
//  App
//
//  Created by Ethan Bonin on 3/18/19.
//

import Foundation
import Vapor

struct LoginModel: Content {
    let userName: String
    let password: String
    let memberId: String
    let email: String
}
