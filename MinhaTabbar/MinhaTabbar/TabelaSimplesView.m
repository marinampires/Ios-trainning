//
//  TabelaSimplesView.m
//  MinhaTabbar
//
//  Created by Marina Melo Pires on 23/09/12.
//  Copyright (c) 2012 Marina Melo Pires. All rights reserved.
//

#import "TabelaSimplesView.h"
#import "ModalTabelaSimplesView.h"

@interface TabelaSimplesView ()

@end

@implementation TabelaSimplesView

@synthesize arrayDados;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Table", @"Table");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
        //self.tabbar item.title
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    arrayDados = [[NSMutableArray alloc] init];
    
    NSDictionary* dictBrasil = [NSDictionary dictionaryWithObjectsAndKeys:@"Brasil", @"pais", @"Português", @"idioma", @"Brazil.gif", @"bandeira", @"http://www.google.com.br", @"url", nil];
    
    [arrayDados addObject:dictBrasil];
    
    NSDictionary* dictArgentina = [NSDictionary dictionaryWithObjectsAndKeys:@"Argentina", @"pais", @"Espanhol", @"idioma", @"Argentina.gif", @"bandeira", @"http://www.facebook.com", @"url", nil];
    
    [arrayDados addObject:dictArgentina];
    
    NSDictionary* dictUsa = [NSDictionary dictionaryWithObjectsAndKeys:@"EUA", @"pais", @"Inglês", @"idioma", @"USA.gif", @"bandeira", @"http://www.globo.com", @"url", nil];
    
    [arrayDados addObject:dictUsa];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.arrayDados count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary* dict = [self.arrayDados objectAtIndex:indexPath.row];
    cell.textLabel.text = [dict objectForKey:@"pais"];
    cell.detailTextLabel.text = [dict objectForKey:@"idioma"];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"selecionou");
    ModalTabelaSimplesView *modalView = [[ModalTabelaSimplesView alloc] initWithNibName:@"ModalTabelaSimplesView" bundle:nil];
    
    [modalView setLinhaClicada: indexPath.row + 1];
    [self presentModalViewController:modalView animated:YES];
}

@end
