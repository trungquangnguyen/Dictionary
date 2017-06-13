//
//  ViewController.swift
//  DictionaryIOS
//
//  Created by SSD on 6/1/17.
//  Copyright © 2017 SSD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        loadTutorial()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController {
//    - (void)loadTutorials {
//    // 1
//    NSURL *tutorialsUrl = [NSURL URLWithString:@"http://www.raywenderlich.com/tutorials"];
//    NSData *tutorialsHtmlData = [NSData dataWithContentsOfURL:tutorialsUrl];
//    
//    // 2
//    TFHpple *tutorialsParser = [TFHpple hppleWithHTMLData:tutorialsHtmlData];
//    
//    // 3
//    NSString *tutorialsXpathQueryString = @"//div[@class='content-wrapper']/ul/li/a";
//    NSArray *tutorialsNodes = [tutorialsParser searchWithXPathQuery:tutorialsXpathQueryString];
//    
//    // 4
//    NSMutableArray *newTutorials = [[NSMutableArray alloc] initWithCapacity:0];
//    for (TFHppleElement *element in tutorialsNodes) {
//    // 5
//    Tutorial *tutorial = [[Tutorial alloc] init];
//    [newTutorials addObject:tutorial];
//    
//    // 6
//    tutorial.title = [[element firstChild] content];
//    
//    // 7
//    tutorial.url = [element objectForKey:@"href"];
//    }
//    
//    // 8
//    _objects = newTutorials;
//    [self.tableView reloadData];
//    }
    func loadTutorial(){
       //let tutorialURL = URL(string: "http://www.oxfordlearnersdictionaries.com/definition/english/noise?q=noise")
            let tutorialURL = URL(string: "https://www.raywenderlich.com/tutorials")
        do {
            let data = try Data(contentsOf: tutorialURL!)
            let totorialParse = TFHpple(htmlData: data)
            
//            3
            //let tutorialsXpathQueryString = "//div[@id='entryContent']"
            let tutorialsXpathQueryString = "//div[@class='content-wrapper']/ul/li/a"
            let tutorialsNodes = totorialParse?.search(withXPathQuery: tutorialsXpathQueryString)
            
//            4
            for element in tutorialsNodes! {
                print(element)
                print((element as! TFHppleElement).firstChild.content)
                print((element as! TFHppleElement).object(forKey: "href"))
                print("___")
            }
        } catch _ {
            
        }
        
        
        //let tutorialsHtmlData = NSData(dataW)
    }
}
