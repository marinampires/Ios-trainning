//
//  ViewController.h
//  Movie
//
//  Created by Marina Melo Pires on 21/09/12.
//  Copyright (c) 2012 Marina Melo Pires. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController : UIViewController

@property(nonatomic, strong) IBOutlet UIView *viewParaMovies;
@property(nonatomic, strong) IBOutlet UILabel *movieInfo;
@property(nonatomic, strong) IBOutlet UIImageView *viewThumbNail1;
@property(nonatomic, strong) IBOutlet UIImageView *viewThumbNail2;

@property(nonatomic, strong) MPMoviePlayerController *moviePlayerLocal;
@property(nonatomic, strong) MPMoviePlayerController *moviePlayerRemoto;

-(IBAction)tocarMovieLocal;
-(IBAction)tocarMovieRemoto;

@end
