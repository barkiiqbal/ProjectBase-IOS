//
//  ColorConstant.swift
//  ProjectBase
//
//  Created by Motivator on 21/03/2018.
//  Copyright © 2018 Motivator. All rights reserved.
//

import Foundation
import UIKit

public struct AppColor {
    
    private struct Alphas {
        static let Opaque = CGFloat(1)
        static let SemiOpaque = CGFloat(0.8)
        static let SemiTransparent = CGFloat(0.5)
        static let Transparent = CGFloat(0.3)
    }
    
    static let appPrimaryColor =  UIColor.white.withAlphaComponent(Alphas.SemiOpaque)
    static let appSecondaryColor =  UIColor.blue.withAlphaComponent(Alphas.Opaque)
    static let appBackgroundColor =  UIColor.lightGray
    
    struct TextColors {
        static let Error = UIColor.red
        static let Success = UIColor(red: 0.1303, green: 0.9915, blue: 0.0233, alpha: Alphas.Opaque)
    }
    
    struct TabBarColors {
        static let Selected = UIColor.white
        static let NotSelected = UIColor.black
    }
    
    struct NavigationBarColors {
        static let TintColor = UIColor.black
    }
    
    struct OverlayColor {
        static let SemiTransparentBlack = UIColor.black.withAlphaComponent(Alphas.Transparent)
        static let SemiOpaque = UIColor.black.withAlphaComponent(Alphas.SemiOpaque)
        static let demoOverlay = UIColor.black.withAlphaComponent(0.6)
    }
}
