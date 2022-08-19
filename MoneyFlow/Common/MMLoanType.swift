//
//  MMLoanType.swift
//  MoneyFlow
//
//  Created by vijay kumar on 19/08/22.
//

import Foundation



protocol MMLoanTypeDataSource {
    
    var amountLimit: Float { get }
    var amountStartingLimit: Float { get }
    var minimuAmount: String { get }
    var maximumAmount: String  { get }
    
    var interestRateLimit: Float { get }
    var interestRateStartingLimit: Float { get }
    var minimumInterestRate: String { get }
    var maximumInterestRate: String { get }
    
    var durationRateLimit: Float { get }
    var durationRateStartingLimit: Float { get }
    var minimumDurationRate: String { get }
    var maximumDurationRate: String { get }
}

enum MMLoanType: MMLoanTypeDataSource {
    case home
    case personal
    case car
    
    var amountLimit: Float {
        switch self {
        case .personal:
            return 1500000
        case .car:
            return 2000000
        case .home:
            return 20000000
        }
    }
    var amountStartingLimit: Float {
        return 0
    }
    
    var minimuAmount: String {
        return "0"
    }
    
    var maximumAmount: String{
        switch self {
        case .personal:
            return "5L"
        case .car:
            return "20L"
        case .home:
            return "200L"
        }
    }
    
    var interestRateLimit: Float{
        switch self {
        case .home:
            return 20.0
        case .car:
            return 20.0
        case .personal:
            return 25.0
        }
    }
    
    var interestRateStartingLimit: Float{
        return 5.0
    }
    
    var minimumInterestRate: String{
        return "5.0"
    }
    
    var maximumInterestRate: String{
        switch self {
        case .home:
            return "20"
        case .car:
            return "20"
        case .personal:
            return "25"
        }
    }
    
    var durationRateLimit: Float{
        switch self {
        case .personal:
            return 60
        case .car:
            return 84
        case .home:
            return 360
        }
    }
    
    var durationRateStartingLimit: Float{
        return 0
    }
    var minimumDurationRate: String{
        return "0"
    }
    
    var maximumDurationRate: String{
        switch self {
        case .personal:
            return "60M / 5Y"
        case .car:
            return "84M / 7Y"
        case .home:
            return "360M / 30Y"
        }
    }
}
