//
//  UIViewController.swift
//  DictionaryIOS
//
//  Created by trung quang on 12/10/17.
//  Copyright © 2017 SSD. All rights reserved.
//

import UIKit
import MBProgressHUD
import Toast_Swift

fileprivate var isLoading = false
fileprivate var isShowToast = false
fileprivate var textField: UITextField?

extension UIViewController {
    
    class func instantiateFromStoryboard(storyboardName: String) -> Self
    {
        
        return instantiateFromStoryboardHelper(type: self, storyboardName: storyboardName)
    }
    
    private class func instantiateFromStoryboardHelper<T>(type: T.Type, storyboardName: String) -> T
    {
        var storyboardId = ""
        
        let components = "\(self)".components(separatedBy: ".")
        if components.count > 1
        {
            storyboardId = components[1]
        }
        else {
            storyboardId = components[0]
        }
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        
        let controller = storyboard.instantiateViewController(withIdentifier: storyboardId) as! T
        
        return controller
    }
    
    //**************************************************************************/
    // MARK: - Loadding
    /**************************************************************************/
    func showLoadding() {
        guard isLoading != true else{
            return
        }
        isLoading = true
        let view_ = UIApplication.shared.keyWindow
        if view_ != nil {
            MBProgressHUD.showAdded(to: view_!, animated: true)
        } else {
            MBProgressHUD.showAdded(to: self.view, animated: true)
        }
    }
    
    func hideLoadding() {
        let view_ = UIApplication.shared.keyWindow
        if view_ != nil {
            MBProgressHUD.hide(for: view_!, animated: true)
        } else {
            MBProgressHUD.hide(for: self.view, animated: true)
        }
        
        isLoading = false
    }
    //*************************---Loadding---*****************************/
    
    
    //**************************************************************************/
    // MARK: - Hanle KeyBoard Method
    /**************************************************************************/
    open func hideKeyboardWhenTappedAround(cancelTouches: Bool = false, textField_: UITextField? = nil) {
        textField = textField_
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = cancelTouches
        let view_ = UIApplication.shared.keyWindow
        view_?.addGestureRecognizer(tap)
    }
    
    
    //EZSE: Dismisses keyboard
    @objc open func dismissKeyboard() {
        textField?.resignFirstResponder()
        view.endEditing(true)
    }
    //*************************---Hanle KeyBoard Method---*****************************/
    
    
    /**************************************************************************/
    // MARK: - Handle Toast
    /**************************************************************************/
    func showToast(message: String, location: CGPoint? = nil){
        guard !isShowToast else {
            return
        }
        var height: CGFloat = 0
        if location == nil {
            height = view.h + 53 != Screen.HEIGHT - 64 ? Screen.HEIGHT - 150 : view.h - 100
        } else {
            height = location!.y
        }
        view.makeToast(message, duration: 2, point: CGPoint(x: Screen.WIDTH / 2, y: height), title: nil, image: nil, style: ToastStyle.init()) { (bool) in
            isShowToast = false
        }
        isShowToast = true
    }
    /*************************---Handle Toast---*****************************/
}
