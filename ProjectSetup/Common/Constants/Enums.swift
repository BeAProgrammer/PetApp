//
//  Enums.swift
//  AdSpeak
//
//  Created by Prashant Telangi on 4/23/20.
//  Copyright © 2020 Mobisoft Infotech. All rights reserved.
//

import Foundation

enum AdSpeakButtonType {
    case roundedCornersButton
    case ovalButton
}

enum MenuItems: Int {
    case home
    case notifications
    case makeAnInquiry
    case uploadMedia
    case makeAPayment
    case therapistNearYou
    case downloadForms
    case faq
    case contactUs
    case settings
}

enum DateFormattes: String {
    
    case dateFormate1 = "dd MMM, yyyy"
    case dateFormate2 = "dd/MM/YYYY"
    case dateFormate3 = "MM/dd/YYYY"
    case expiryDateFormat = "MM/yy"
    case timeFormat = "hh:mm a"
    case secondsFormat = "hh:mm:ss"
}

enum GenderFlow {
    case selectGender
    case editGender
}

enum CategoryFlow {
    case selectCategory
    case changeCategory
}

enum LoginFlow {
    case newLogin
    case changeNumber
}

enum WebViewFlow: String {
    case privacyPolicy = "PrivacyPolicy"
    case aboutUs = "AboutUs"
    case termsAndCondition = "TermsAndConditions"
}

enum UserDefaultsRepoKeys: String {
    case isTutorialShown
    case fcmtoken = "fcmToken"
    case appVersion
}

enum Language: String {
    case english = "en-US"
}

enum TextFieldType: String {
    case textbox
    case formula
    case datePicker = "date_picker"
    case choice
}
