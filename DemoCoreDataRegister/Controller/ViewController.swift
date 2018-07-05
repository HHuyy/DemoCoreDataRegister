//
//  ViewController.swift
//  DemoCoreDataRegister
//
//  Created by Đừng xóa on 7/3/18.
//  Copyright © 2018 Đừng xóa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    var object: Student?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let studentData = object {
            nameTextField.text = studentData.name
            ageTextField.text = String(studentData.age)
            imageView.image = studentData.image as? UIImage
        }
        
        
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("error")
        }
        imageView.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectingImage(_ sender: UITapGestureRecognizer) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self 
        present(imagePickerController, animated: true, completion: nil)
    }
    
    

    @IBAction func saveData(_ sender: UIBarButtonItem) {
        if object == nil  {
            object = Student(context: AppDelegate.context)
//            print(object)
        }
        guard nameTextField.text != nil else {return}
        guard ageTextField.text != nil else {return}
        object?.name = nameTextField.text
        object?.age = Int64(ageTextField.text!) ?? 0
        object?.image = imageView.image
        DataService.shared.saveData()
        navigationController?.popViewController(animated: true)
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

