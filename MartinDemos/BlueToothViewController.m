//
//  BlueToothViewController.m
//  MartinDemos
//
//  Created by Gao Huang on 15/5/29.
//  Copyright (c) 2015年 Martin. All rights reserved.
//

#import "BlueToothViewController.h"
#import <CoreBluetooth/CoreBluetooth.h>
@interface BlueToothViewController ()<CBCentralManagerDelegate>
{
    CBCentralManager *manager;
}
@end

@implementation BlueToothViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    manager = [[CBCentralManager alloc] initWithDelegate:self queue:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)scan:(id)sender {
    [manager scanForPeripheralsWithServices:nil options:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)centralManagerDidUpdateState:(CBCentralManager *)central{
    NSLog(@"central:%@",central);
}

- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary *)advertisementData RSSI:(NSNumber *)RSSI
{
//    if([peripheral.name  isEqualToString:BLE_SERVICE_NAME]){
//        [self connect:peripheral];
//    }
    NSLog(@"central:%@,peripheral:%@,advertisementData:%@,RSSI:%@",central,peripheral,advertisementData,RSSI);
}

-(BOOL)connect:(CBPeripheral *)peripheral{
    [manager connectPeripheral:peripheral
                            options:[NSDictionary dictionaryWithObject:[NSNumber numberWithBool:YES] forKey:CBConnectPeripheralOptionNotifyOnDisconnectionKey]];
    return YES;
}

- (void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral
{
    
    NSLog(@"Did connect to peripheral: %@", peripheral);
//    _testPeripheral = peripheral;
//    
//    [peripheral setDelegate:self];//查找服务
//    [peripheral discoverServices:nil];
    
    
}

- (void)peripheral:(CBPeripheral *)peripheral didDiscoverServices:(NSError *)error
{
    
    
    NSLog(@"didDiscoverServices");
//    
//    if (error)
//    {
//        NSLog(@"Discovered services for %@ with error: %@", peripheral.name, [error localizedDescription]);
//        
//        if ([self.delegate respondsToSelector:@selector(DidNotifyFailConnectService:withPeripheral:error:)])
//            [self.delegate DidNotifyFailConnectService:nil withPeripheral:nil error:nil];
//        
//        return;
//    }
//    
//    
//    for (CBService *service in peripheral.services)
//    {
//        //发现服务
//        if ([service.UUID isEqual:[CBUUID UUIDWithString:UUIDSTR_ISSC_PROPRIETARY_SERVICE]])
//        {
//            NSLog(@"Service found with UUID: %@", service.UUID);  <br>//查找特征
//            [peripheral discoverCharacteristics:nil forService:service];
//            break;
//        }
//        
//        
//    }
}

- (void)peripheral:(CBPeripheral *)peripheral didDiscoverCharacteristicsForService:(CBService *)service error:(NSError *)error
{
    
//    if (error)
//    {
//        NSLog(@"Discovered characteristics for %@ with error: %@", service.UUID, [error localizedDescription]);
//        
//        [self error];
//        return;
//    }
//    
//    NSLog(@"服务：%@",service.UUID);
//    for (CBCharacteristic *characteristic in service.characteristics)
//    {
//        //发现特征
//        if ([characteristic.UUID isEqual:[CBUUID UUIDWithString:@"xxxxxxx"]]) {
//            NSLog(@"监听：%@",characteristic);<br>//监听特征
//            [self.peripheral setNotifyValue:YES forCharacteristic:characteristic];
//        }
//        
//    }
}

- (void)peripheral:(CBPeripheral *)peripheral didUpdateValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error
{
//    if (error)
//    {
//        NSLog(@"Error updating value for characteristic %@ error: %@", characteristic.UUID, [error localizedDescription]);
//        self.error_b = BluetoothError_System;
//        [self error];
//        return;
//    }
//    
//    //    NSLog(@"收到的数据：%@",characteristic.value);
//    [self decodeData:characteristic.value];
}
@end
