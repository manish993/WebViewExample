//
//  ViewController.swift
//  WebViewExample
//
//  Created by moxDroid on 2020-03-24.
//  Copyright © 2020 moxDroid. All rights reserved.
//

import UIKit
//Need to use
import WebKit

import SafariServices

class ViewController: UIViewController {

    @IBOutlet weak var myWebKitView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadLambtonUrl()
    }
    
    
    @IBAction func showHistory(_ sender: UIBarButtonItem)
    {
        if myWebKitView.canGoBack
        {
            let historyList =  myWebKitView.backForwardList.backList
            if historyList.count > 0
            {
                for item in historyList {
                    print("\(String(describing: item.title)) -  \(item.url.absoluteURL)")
                }
            }
        }
    }
    
    
    func loadLambtonUrl()
    {
        let url = URL(string: "https://www.lambtoncollege.ca/")
        let urlReq = URLRequest(url: url!)
        myWebKitView.load(urlReq)
    }
    
    func loadHtmlString()
    {
        let htmlString = "<h1>Hello World</h1>"
        myWebKitView.loadHTMLString(htmlString, baseURL: nil)
        
    }
    
    //Use Safari View Controller to open web link
     @IBAction func watchNowUsingSafari(_ sender: UIBarButtonItem)
    {
        let videoUrl = URL(string: "https://www.youtube.com/watch?v=gnjXbR2eNDE")
        let safariVC = SFSafariViewController(url: videoUrl!)
        self.present(safariVC, animated: true, completion: nil)
    }
    
    
    @IBAction func btnNavigation(_ sender: UIBarButtonItem)
    {
        switch sender.tag {
        case 0://Home Button is pressed
            //myWebKitView.backForwardList.backList[0]
            myWebKitView.reloadFromOrigin()
        case 1://Prev Button is pressed
            if myWebKitView.canGoBack
            {
                print("Go back")
                myWebKitView.goBack()
            }else
            {
                print("Can't Go back")
            }
            
        case 2:
            if myWebKitView.canGoForward
            {
                print("Go Forward")
                myWebKitView.goForward()
            }else
            {
                print("Can't Go forward")
            }
            
        case 3:
            myWebKitView.reloadFromOrigin()
            
        default:
            print("No Navigation action found...")
        }
    }
    
}

