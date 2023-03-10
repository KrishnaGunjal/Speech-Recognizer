//
//  SiriViewController.swift
//  Oma
//
//  Created by Krishna Gunjal on 04/01/23.
//

import UIKit
import IntentsUI

class SiriViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addSiriButton(to: self.view)
    }

    func addSiriButton(to view: UIView) {
     if #available(iOS 12.0, *) {
         let button = INUIAddVoiceShortcutButton(style: .whiteOutline)
             button.shortcut = INShortcut(intent: intent )
             button.delegate = self
             button.translatesAutoresizingMaskIntoConstraints = false
             view.addSubview(button)
             view.centerXAnchor.constraint(equalTo: button.centerXAnchor).isActive = true
             view.centerYAnchor.constraint(equalTo: button.centerYAnchor).isActive = true
         }
     
     }
     
     func showMessage() {
         let alert = UIAlertController(title: "Done!", message: "This is your first shortcut action!", preferredStyle: UIAlertController.Style.alert)
         alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
         self.present(alert, animated: true, completion: nil)
     }

 }

 extension SiriViewController {
     @available(iOS 12.0, *)
     public var intent: INPlayMediaIntent {
         let testIntent = INPlayMediaIntent()
         testIntent.suggestedInvocationPhrase = "Test command"
         return testIntent
     }
 }

 extension SiriViewController: INUIAddVoiceShortcutButtonDelegate {
     @available(iOS 12.0, *)
     func present(_ addVoiceShortcutViewController: INUIAddVoiceShortcutViewController, for addVoiceShortcutButton: INUIAddVoiceShortcutButton) {
         addVoiceShortcutViewController.delegate = self
         addVoiceShortcutViewController.modalPresentationStyle = .formSheet
         present(addVoiceShortcutViewController, animated: true, completion: nil)
     }
     
     @available(iOS 12.0, *)
     func present(_ editVoiceShortcutViewController: INUIEditVoiceShortcutViewController, for addVoiceShortcutButton: INUIAddVoiceShortcutButton) {
         editVoiceShortcutViewController.delegate = self
         editVoiceShortcutViewController.modalPresentationStyle = .formSheet
         present(editVoiceShortcutViewController, animated: true, completion: nil)
     }
     
     
 }

 extension SiriViewController: INUIAddVoiceShortcutViewControllerDelegate {
     @available(iOS 12.0, *)
     func addVoiceShortcutViewController(_ controller: INUIAddVoiceShortcutViewController, didFinishWith voiceShortcut: INVoiceShortcut?, error: Error?) {
         controller.dismiss(animated: true, completion: nil)
     }
     
     @available(iOS 12.0, *)
     func addVoiceShortcutViewControllerDidCancel(_ controller: INUIAddVoiceShortcutViewController) {
         controller.dismiss(animated: true, completion: nil)
     }
     
     
 }

 extension SiriViewController: INUIEditVoiceShortcutViewControllerDelegate {
     @available(iOS 12.0, *)
     func editVoiceShortcutViewController(_ controller: INUIEditVoiceShortcutViewController, didUpdate voiceShortcut: INVoiceShortcut?, error: Error?) {
         controller.dismiss(animated: true, completion: nil)
     }
     
     @available(iOS 12.0, *)
     func editVoiceShortcutViewController(_ controller: INUIEditVoiceShortcutViewController, didDeleteVoiceShortcutWithIdentifier deletedVoiceShortcutIdentifier: UUID) {
         controller.dismiss(animated: true, completion: nil)
     }
     
     @available(iOS 12.0, *)
     func editVoiceShortcutViewControllerDidCancel(_ controller: INUIEditVoiceShortcutViewController) {
         controller.dismiss(animated: true, completion: nil)
     }
 }
