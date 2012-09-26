//
//  MovieViewController.m
//  MinhaTabbar
//
//  Created by Marina Melo Pires on 26/09/12.
//  Copyright (c) 2012 Marina Melo Pires. All rights reserved.
//

#import "MovieViewController.h"

@interface MovieViewController ()

@end

@implementation MovieViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Movie", @"Movie");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
        //self.tabbar item.title
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"load ");
/*    NSString *path = [[NSBundle mainBundle] pathForResource:@"filme" ofType:@"mp4"];
    NSURL *movieURL = [NSURL fileURLWithPath:path];
    self.moviePlayerLocal = [[MPMoviePlayerController alloc] initWithContentURL:movieURL];
    self.moviePlayerLocal.scalingMode = MPMovieScalingModeAspectFit;
    self.moviePlayerLocal.view.frame = self.viewParaMovies.bounds;
    
    [self.viewParaMovies addSubview:self.moviePlayerLocal.view];
  */
    NSString *path = [[NSBundle mainBundle] pathForResource:@"filme" ofType:@"mp4"];
	
	NSURL	*movieURL = [NSURL fileURLWithPath:path];
	
    _moviePlayerLocal = [[MPMoviePlayerController alloc]initWithContentURL:movieURL];
	
	_moviePlayerLocal.scalingMode = MPMovieScalingModeAspectFit;
	
	_moviePlayerLocal.view.frame = _viewParaMovies.bounds;
	
	[_viewParaMovies addSubview:_moviePlayerLocal.view];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewDidAppear:(BOOL)animated{
    NSLog(@"Aparaceu");
    [_moviePlayerLocal play];
}


-(void) viewDidDisappear:(BOOL)animated{
    NSLog(@"Desaparaceu");
    [_moviePlayerLocal stop];

}

@end
