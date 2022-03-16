//
//  Color.swift
//  GoalsAppSwiftUI
//
//  Created by Mehdi MMS on 15/03/2022.
//

import Foundation
import SwiftUI

// New Colors
extension Color {
    
    static let theme = ColorTheme()
//    static let theme = ColorTheme3()
    static let launch = LaunchTheme()
}


struct ColorTheme {
    
    let accent          = Color("AccentColor")
    let background      = Color("BackgroundColor")
    let green           = Color("GreenColor")
    let red             = Color("RedColor")
    let secondaryText   = Color("SecondaryTextColor")
}

struct ColorTheme2 {
    
    let accent          = Color("AccentColor")
    let background      = Color("BackgroundColor")
    let green           = Color("GreenColor")
    let red             = Color("RedColor")
    let secondaryText   = Color("SecondaryTextColor")
}

struct ColorTheme3 {
    
    let accent          = Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1))
    let background      = Color(#colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1))
    let green           = Color(#colorLiteral(red: 0.5808190107, green: 0.0884276256, blue: 0.3186392188, alpha: 1))
    let red             = Color(#colorLiteral(red: 1, green: 0.5409764051, blue: 0.8473142982, alpha: 1))
    let secondaryText   = Color(#colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1))
}

// Like this we can add N number of themes to our application

struct LaunchTheme {
    
    let accent          = Color("LaunchAccentColor")
    let background      = Color("LaunchBackgroundColor")
    let green           = Color("GreenColor")
    let red             = Color("RedColor")
    let secondaryText   = Color("SecondaryTextColor")
}
