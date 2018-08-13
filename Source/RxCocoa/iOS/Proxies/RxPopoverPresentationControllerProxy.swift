//
//  RxPopoverPresentationControllerProxy.swift
//  RxSwiftExt-iOS
//
//  Created by Vladimir Kushelkov on 13/08/2018.
//  Copyright © 2018 RxSwiftCommunity. All rights reserved.
//

#if os(iOS)

import UIKit
import RxSwift
import RxCocoa

@available(iOS 8.0, *)
extension UIPopoverPresentationController: HasDelegate {
    public typealias Delegate = UIPopoverPresentationControllerDelegate
}

@available(iOS 8.0, *)
open class RxPopoverPresentationControllerProxy
    : DelegateProxy<UIPopoverPresentationController, UIPopoverPresentationControllerDelegate>
    , UIPopoverPresentationControllerDelegate
    , DelegateProxyType {
    
    /// Typed parent object.
    public weak private(set) var popoverPresentationController: UIPopoverPresentationController?
    
    /// - parameter popoverPresentationController: Parent object for delegate proxy.
    public init(popoverPresentationController: UIPopoverPresentationController) {
        self.popoverPresentationController = popoverPresentationController
        super.init(parentObject: popoverPresentationController,
                   delegateProxy: RxPopoverPresentationControllerProxy.self)
    }
    
    // Register known implementations
    public static func registerKnownImplementations() {
        self.register { RxPopoverPresentationControllerProxy(popoverPresentationController: $0) }
    }
}

#endif
