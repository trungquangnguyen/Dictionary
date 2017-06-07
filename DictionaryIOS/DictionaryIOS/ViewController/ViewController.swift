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
        // Do any additional setup after loading the view, typically from a nib.
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
        let tutorialURL = URL(string: "http://www.raywenderlich.com/tutorials")
        do {
           let data = try Data(contentsOf: tutorialURL!)
        } catch _ {
            
        }
        
        //let tutorialsHtmlData = NSData(dataW)
    }
}
