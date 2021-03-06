//
//  ViewController.m
//  TableViwe
//
//  Created by Marina Melo Pires on 18/09/12.
//  Copyright (c) 2012 Marina Melo Pires. All rights reserved.
//

#import "ViewController.h"
#import "MyCell.h"
#import "ModalView.h"


@interface ViewController ()

@end

@implementation ViewController

@synthesize arrayTabela;

- (void)viewDidLoad
{
    [super viewDidLoad];
    arrayTabela = [[NSMutableArray alloc] init];
    
    NSDictionary* dictBrasil = [NSDictionary dictionaryWithObjectsAndKeys:@"Brasil", @"pais", @"Português", @"idioma", @"Brazil.gif", @"bandeira", @"http://www.google.com.br", @"url", nil];

    [arrayTabela addObject:dictBrasil];
    
    NSDictionary* dictArgentina = [NSDictionary dictionaryWithObjectsAndKeys:@"Argentina", @"pais", @"Espanhol", @"idioma", @"Argentina.gif", @"bandeira", @"http://www.facebook.com", @"url", nil];
    
    [arrayTabela addObject:dictArgentina];
    
    NSDictionary* dictUsa = [NSDictionary dictionaryWithObjectsAndKeys:@"EUA", @"pais", @"Inglês", @"idioma", @"USA.gif", @"bandeira", @"http://www.globo.com", @"url", nil];
    
    [arrayTabela addObject:dictUsa];
    
    self.tableView.rowHeight = 60;
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [arrayTabela count];
}


-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"Países";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    MyCell *cell = (MyCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil){
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MyCell" owner:nil options:nil] objectAtIndex: 0];
    }
    
    NSDictionary* dict = [arrayTabela objectAtIndex:indexPath.row];
    [cell.pais setText:[dict objectForKey:@"pais"]];
        [cell.idioma setText:[dict objectForKey:@"idioma"]];
   // cell.detailTextLabel.text = [dict objectForKey:@"idioma"];
    [cell.bandeira setImage:[UIImage imageNamed:[dict objectForKey:@"bandeira"]]];
    
    return cell;
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [arrayTabela removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }
}

-(void)insertNewObject:(id) sender{
    int posicao = [arrayTabela count];
    [self.arrayTabela insertObject:@"EU" atIndex:posicao];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:posicao inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"Modal");
    ModalView *modalView = [[ModalView alloc] initWithNibName:@"ModalView" bundle:nil];
//    [self presentModalViewController:modalView animated:YES];
    
    NSDictionary *dict =[arrayTabela objectAtIndex:indexPath.row];
    
    [modalView setDict:dict];
    
    [self.navigationController pushViewController:modalView animated:YES];
}

@end
