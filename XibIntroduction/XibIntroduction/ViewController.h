//
//  ViewController.h
//  XibIntroduction
//
//  Created by Marina Melo Pires on 18/09/12.
//  Copyright (c) 2012 Marina Melo Pires. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    //privado
    //IBOutlet UILabel *lblLegenda;
}

//Publica
@property(nonatomic, strong) IBOutlet UILabel *lblLegenda;

-(IBAction)mudarLegenda;

@end
