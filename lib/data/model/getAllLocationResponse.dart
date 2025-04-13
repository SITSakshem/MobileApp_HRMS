import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/state_manager.dart';

/// messageType : 1
/// error : null
/// message : "Data Loaded"
/// returnId : [{"id":0,"locationId":1,"code":"HO","name":"Head Office","isActive":true,"officeAddress":null,"locality":"A-1/175, 2rd Floor, Main Najafgarh Road","city":"","pincode":"110018","orgId":1,"companyId":1,"zoneId":1,"stateId":4021,"countryId":101,"locationType":1,"stateName":"","countryName":"","orgName":"AH - Ananya Herbal","companyName":"AH - Delhi-NCR","zoneName":"India","email":"","alternateEmail":"","contactNo":"","alternateContactNo":"","longitude":"77.074142","latitude":"28.628155","modifiedDt":"2000-01-01T00:00:00","modifiedBy":"System","modifiedRemarks":"","requestedDt":"2024-06-09T12:32:33.5558764+05:30","requestedBy":null,"requestedRemarks":null,"approvalDt":null,"approvalBy":null,"approvalRemarks":"","entityType":0,"approvalStatus":0},{"id":0,"locationId":2,"code":"MT-BH","name":"Muskan Traders (Bihar Branch)","isActive":true,"officeAddress":"Bh","locality":null,"city":"Patna","pincode":"800001","orgId":1,"companyId":2,"zoneId":2,"stateId":4037,"countryId":101,"locationType":5,"stateName":"","countryName":"","orgName":"AH - Ananya Herbal","companyName":"BH - Bihar","zoneName":"Patna","email":"mt@abc.com","alternateEmail":null,"contactNo":"1234567890","alternateContactNo":null,"longitude":"77.074142","latitude":"28.628155","modifiedDt":"2024-05-07T20:03:15.7613057","modifiedBy":"Admin","modifiedRemarks":"","requestedDt":"2024-06-09T12:32:33.6273267+05:30","requestedBy":null,"requestedRemarks":null,"approvalDt":null,"approvalBy":null,"approvalRemarks":"","entityType":0,"approvalStatus":0},{"id":0,"locationId":3,"code":"OSMA-BH","name":"Om Sai Marketing Agency","isActive":true,"officeAddress":"Patna","locality":null,"city":"Patna","pincode":"800001","orgId":1,"companyId":2,"zoneId":2,"stateId":4037,"countryId":101,"locationType":5,"stateName":"","countryName":"","orgName":"AH - Ananya Herbal","companyName":"BH - Bihar","zoneName":"Patna","email":"osma@abc.com","alternateEmail":null,"contactNo":"1234567890","alternateContactNo":null,"longitude":"77.074142","latitude":"28.628155","modifiedDt":"2024-05-07T20:04:45.8025824","modifiedBy":"Admin","modifiedRemarks":"","requestedDt":"2024-06-09T12:32:33.6275304+05:30","requestedBy":null,"requestedRemarks":null,"approvalDt":null,"approvalBy":null,"approvalRemarks":"","entityType":0,"approvalStatus":0},{"id":0,"locationId":4,"code":"OSTGT","name":"Omm Sai Traders & GM Traders","isActive":true,"officeAddress":"Patna","locality":null,"city":"Patna","pincode":"800001","orgId":1,"companyId":2,"zoneId":2,"stateId":4037,"countryId":101,"locationType":5,"stateName":"","countryName":"","orgName":"AH - Ananya Herbal","companyName":"BH - Bihar","zoneName":"Patna","email":"ostgt@abc.com","alternateEmail":null,"contactNo":"1234567890","alternateContactNo":null,"longitude":"77.074142","latitude":"28.628155","modifiedDt":"2024-05-07T20:06:12.5412888","modifiedBy":"Admin","modifiedRemarks":"","requestedDt":"2024-06-09T12:32:33.6276354+05:30","requestedBy":null,"requestedRemarks":null,"approvalDt":null,"approvalBy":null,"approvalRemarks":"","entityType":0,"approvalStatus":0},{"id":0,"locationId":5,"code":"S-C-P","name":"Stylz & Care - Patna","isActive":true,"officeAddress":"Patna","locality":null,"city":"Patna","pincode":"800001","orgId":1,"companyId":2,"zoneId":2,"stateId":4037,"countryId":101,"locationType":5,"stateName":"","countryName":"","orgName":"AH - Ananya Herbal","companyName":"BH - Bihar","zoneName":"Patna","email":"scp@abc.com","alternateEmail":null,"contactNo":"1234567890","alternateContactNo":null,"longitude":"77.074142","latitude":"28.628155","modifiedDt":"2024-05-07T20:07:36.599382","modifiedBy":"Admin","modifiedRemarks":"","requestedDt":"2024-06-09T12:32:33.6277306+05:30","requestedBy":null,"requestedRemarks":null,"approvalDt":null,"approvalBy":null,"approvalRemarks":"","entityType":0,"approvalStatus":0},{"id":0,"locationId":6,"code":"Aaryan","name":"Aaryan","isActive":true,"officeAddress":"Patna","locality":null,"city":"Patna","pincode":"800001","orgId":1,"companyId":2,"zoneId":2,"stateId":4037,"countryId":101,"locationType":5,"stateName":"","countryName":"","orgName":"AH - Ananya Herbal","companyName":"BH - Bihar","zoneName":"Patna","email":"Aaryan@abc.com","alternateEmail":null,"contactNo":"1234567890","alternateContactNo":null,"longitude":"77.074142","latitude":"28.628155","modifiedDt":"2024-05-07T20:08:31.3248212","modifiedBy":"Admin","modifiedRemarks":"","requestedDt":"2024-06-09T12:32:33.6278367+05:30","requestedBy":null,"requestedRemarks":null,"approvalDt":null,"approvalBy":null,"approvalRemarks":"","entityType":0,"approvalStatus":0},{"id":0,"locationId":7,"code":"AC-P","name":"Anmol Choore - Patna","isActive":true,"officeAddress":"Patna","locality":null,"city":"Patna","pincode":"800001","orgId":1,"companyId":2,"zoneId":2,"stateId":4037,"countryId":101,"locationType":5,"stateName":"","countryName":"","orgName":"AH - Ananya Herbal","companyName":"BH - Bihar","zoneName":"Patna","email":"acp@abc.com","alternateEmail":null,"contactNo":"1234567890","alternateContactNo":null,"longitude":"77.074142","latitude":"28.628155","modifiedDt":"2024-05-07T20:09:45.427021","modifiedBy":"Admin","modifiedRemarks":"","requestedDt":"2024-06-09T12:32:33.6279391+05:30","requestedBy":null,"requestedRemarks":null,"approvalDt":null,"approvalBy":null,"approvalRemarks":"","entityType":0,"approvalStatus":0},{"id":0,"locationId":8,"code":"SNK","name":"SriNagar Kunj - Patna","isActive":true,"officeAddress":"Patna","locality":null,"city":"Patna","pincode":"800001","orgId":1,"companyId":2,"zoneId":2,"stateId":4037,"countryId":101,"locationType":5,"stateName":"","countryName":"","orgName":"AH - Ananya Herbal","companyName":"BH - Bihar","zoneName":"Patna","email":"snk@abc.com","alternateEmail":null,"contactNo":"1234567890","alternateContactNo":null,"longitude":"77.074142","latitude":"28.628155","modifiedDt":"2024-05-07T20:10:50.6955329","modifiedBy":"Admin","modifiedRemarks":"","requestedDt":"2024-06-09T12:32:33.6280381+05:30","requestedBy":null,"requestedRemarks":null,"approvalDt":null,"approvalBy":null,"approvalRemarks":"","entityType":0,"approvalStatus":0},{"id":0,"locationId":9,"code":"BBS-Delhi","name":"Baby Bangle Store, Moti Nagar","isActive":true,"officeAddress":"DL","locality":null,"city":"Delhi","pincode":"110001","orgId":1,"companyId":1,"zoneId":3,"stateId":4021,"countryId":101,"locationType":5,"stateName":"","countryName":"","orgName":"AH - Ananya Herbal","companyName":"AH - Delhi-NCR","zoneName":"Delhi","email":"bbsdelhi@abc.com","alternateEmail":null,"contactNo":"1234657890","alternateContactNo":null,"longitude":"77.074142","latitude":"28.628155","modifiedDt":"2024-05-07T20:24:27.2538587","modifiedBy":"Admin","modifiedRemarks":"","requestedDt":"2024-06-09T12:32:33.628137+05:30","requestedBy":null,"requestedRemarks":null,"approvalDt":null,"approvalBy":null,"approvalRemarks":"","entityType":0,"approvalStatus":0},{"id":0,"locationId":10,"code":"CH-Delhi","name":"Cosmetic Hub, Uttam Nagar","isActive":true,"officeAddress":"DL","locality":null,"city":"Delhi","pincode":"110001","orgId":1,"companyId":1,"zoneId":3,"stateId":4021,"countryId":101,"locationType":5,"stateName":"","countryName":"","orgName":"AH - Ananya Herbal","companyName":"AH - Delhi-NCR","zoneName":"Delhi","email":"chdelhi@abc.com","alternateEmail":null,"contactNo":"1234567890","alternateContactNo":null,"longitude":"77.074142","latitude":"28.628155","modifiedDt":"2024-05-07T20:25:31.035589","modifiedBy":"Admin","modifiedRemarks":"","requestedDt":"2024-06-09T12:32:33.6282642+05:30","requestedBy":null,"requestedRemarks":null,"approvalDt":null,"approvalBy":null,"approvalRemarks":"","entityType":0,"approvalStatus":0},{"id":0,"locationId":11,"code":"SSS-Dwarka","name":"Sri Shyam Store - Dwarka  Branch","isActive":true,"officeAddress":"DL","locality":null,"city":"Delhi","pincode":"110075","orgId":1,"companyId":1,"zoneId":3,"stateId":4021,"countryId":101,"locationType":5,"stateName":"","countryName":"","orgName":"AH - Ananya Herbal","companyName":"AH - Delhi-NCR","zoneName":"Delhi","email":"sss@abc.com","alternateEmail":null,"contactNo":"1234567890","alternateContactNo":null,"longitude":"77.074142","latitude":"28.628155","modifiedDt":"2024-05-07T20:27:23.5381441","modifiedBy":"Admin","modifiedRemarks":"","requestedDt":"2024-06-09T12:32:33.6283653+05:30","requestedBy":null,"requestedRemarks":null,"approvalDt":null,"approvalBy":null,"approvalRemarks":"","entityType":0,"approvalStatus":0},{"id":0,"locationId":12,"code":"SBP-delhi","name":"Sonam Beauty Parlour - Delhi","isActive":true,"officeAddress":"DL","locality":null,"city":"Delhi","pincode":"110001","orgId":1,"companyId":1,"zoneId":3,"stateId":4021,"countryId":101,"locationType":5,"stateName":"","countryName":"","orgName":"AH - Ananya Herbal","companyName":"AH - Delhi-NCR","zoneName":"Delhi","email":"sbp@abc.com","alternateEmail":null,"contactNo":"1234567890","alternateContactNo":null,"longitude":"77.074142","latitude":"28.628155","modifiedDt":"2024-05-07T20:28:54.0959513","modifiedBy":"Admin","modifiedRemarks":"","requestedDt":"2024-06-09T12:32:33.6284615+05:30","requestedBy":null,"requestedRemarks":null,"approvalDt":null,"approvalBy":null,"approvalRemarks":"","entityType":0,"approvalStatus":0},{"id":0,"locationId":13,"code":"SRM-delhi","name":"Shri Ram Medicos - Delhi","isActive":true,"officeAddress":"DL","locality":null,"city":"Delhi","pincode":"110001","orgId":1,"companyId":1,"zoneId":3,"stateId":4021,"countryId":101,"locationType":5,"stateName":"","countryName":"","orgName":"AH - Ananya Herbal","companyName":"AH - Delhi-NCR","zoneName":"Delhi","email":"srm@abc.com","alternateEmail":null,"contactNo":"1234567890","alternateContactNo":null,"longitude":"77.074142","latitude":"28.628155","modifiedDt":"2024-05-07T20:30:53.4346252","modifiedBy":"Admin","modifiedRemarks":"","requestedDt":"2024-06-09T12:32:33.6285527+05:30","requestedBy":null,"requestedRemarks":null,"approvalDt":null,"approvalBy":null,"approvalRemarks":"","entityType":0,"approvalStatus":0},{"id":0,"locationId":14,"code":"AMC-delhi","name":"Ashish Medicos & Cosmetics,Sagarpur","isActive":true,"officeAddress":"DL","locality":null,"city":"Delhi","pincode":"110072","orgId":1,"companyId":1,"zoneId":3,"stateId":4021,"countryId":101,"locationType":5,"stateName":"","countryName":"","orgName":"AH - Ananya Herbal","companyName":"AH - Delhi-NCR","zoneName":"Delhi","email":"amcdelhi@abc.com","alternateEmail":null,"contactNo":"1234567890","alternateContactNo":null,"longitude":"77.074142","latitude":"28.628155","modifiedDt":"2024-05-07T20:32:15.855019","modifiedBy":"Admin","modifiedRemarks":"","requestedDt":"2024-06-09T12:32:33.6286645+05:30","requestedBy":null,"requestedRemarks":null,"approvalDt":null,"approvalBy":null,"approvalRemarks":"","entityType":0,"approvalStatus":0},{"id":0,"locationId":15,"code":"EC-delhi","name":"Empire Cosmetics - Delhi","isActive":true,"officeAddress":"DL","locality":null,"city":"Delhi","pincode":"110001","orgId":1,"companyId":1,"zoneId":3,"stateId":4021,"countryId":101,"locationType":5,"stateName":"","countryName":"","orgName":"AH - Ananya Herbal","companyName":"AH - Delhi-NCR","zoneName":"Delhi","email":"ec@abc.com","alternateEmail":null,"contactNo":"1234567890","alternateContactNo":null,"longitude":"77.074142","latitude":"28.628155","modifiedDt":"2024-05-07T20:33:19.6626164","modifiedBy":"Admin","modifiedRemarks":"","requestedDt":"2024-06-09T12:32:33.628767+05:30","requestedBy":null,"requestedRemarks":null,"approvalDt":null,"approvalBy":null,"approvalRemarks":"","entityType":0,"approvalStatus":0},{"id":0,"locationId":16,"code":"F-D","name":"Floater, Delhi","isActive":true,"officeAddress":"DL","locality":null,"city":"Delhi","pincode":"110001","orgId":1,"companyId":1,"zoneId":3,"stateId":4021,"countryId":101,"locationType":5,"stateName":"","countryName":"","orgName":"AH - Ananya Herbal","companyName":"AH - Delhi-NCR","zoneName":"Delhi","email":"f-d@abc.com","alternateEmail":null,"contactNo":"1234567890","alternateContactNo":null,"longitude":"77.074142","latitude":"28.628155","modifiedDt":"2024-05-07T20:34:47.8956427","modifiedBy":"Admin","modifiedRemarks":"","requestedDt":"2024-06-09T12:32:33.6288655+05:30","requestedBy":null,"requestedRemarks":null,"approvalDt":null,"approvalBy":null,"approvalRemarks":"","entityType":0,"approvalStatus":0},{"id":0,"locationId":17,"code":"PM-delhi","name":"Prakash Medicos - Delhi","isActive":true,"officeAddress":"DL","locality":null,"city":"Delhi","pincode":"110001","orgId":1,"companyId":1,"zoneId":3,"stateId":4021,"countryId":101,"locationType":5,"stateName":"","countryName":"","orgName":"AH - Ananya Herbal","companyName":"AH - Delhi-NCR","zoneName":"Delhi","email":"pm@abc.com","alternateEmail":null,"contactNo":"1234567890","alternateContactNo":null,"longitude":"77.074142","latitude":"28.628155","modifiedDt":"2024-05-07T20:35:52.5049647","modifiedBy":"Admin","modifiedRemarks":"","requestedDt":"2024-06-09T12:32:33.6289636+05:30","requestedBy":null,"requestedRemarks":null,"approvalDt":null,"approvalBy":null,"approvalRemarks":"","entityType":0,"approvalStatus":0},{"id":0,"locationId":18,"code":"RBS-delhi","name":"Raju Bangle Store, Moti Nagar","isActive":true,"officeAddress":"DL","locality":null,"city":"Delhi","pincode":"110001","orgId":1,"companyId":1,"zoneId":3,"stateId":4021,"countryId":101,"locationType":5,"stateName":"","countryName":"","orgName":"AH - Ananya Herbal","companyName":"AH - Delhi-NCR","zoneName":"Delhi","email":"rbs@abc.com","alternateEmail":null,"contactNo":"1234567890","alternateContactNo":null,"longitude":"77.074142","latitude":"28.628155","modifiedDt":"2024-05-07T20:37:00.144742","modifiedBy":"Admin","modifiedRemarks":"","requestedDt":"2024-06-09T12:32:33.6290675+05:30","requestedBy":null,"requestedRemarks":null,"approvalDt":null,"approvalBy":null,"approvalRemarks":"","entityType":0,"approvalStatus":0},{"id":0,"locationId":19,"code":"SRM-delhi","name":"Shri Ram Medicos, Delhi","isActive":true,"officeAddress":"DL","locality":null,"city":"Delhi","pincode":"110001","orgId":1,"companyId":1,"zoneId":3,"stateId":4021,"countryId":101,"locationType":5,"stateName":"","countryName":"","orgName":"AH - Ananya Herbal","companyName":"AH - Delhi-NCR","zoneName":"Delhi","email":"srmdelhi@abc.com","alternateEmail":null,"contactNo":"1234567890","alternateContactNo":null,"longitude":"77.074142","latitude":"28.628155","modifiedDt":"2024-05-07T20:37:56.3443558","modifiedBy":"Admin","modifiedRemarks":"","requestedDt":"2024-06-09T12:32:33.6291663+05:30","requestedBy":null,"requestedRemarks":null,"approvalDt":null,"approvalBy":null,"approvalRemarks":"","entityType":0,"approvalStatus":0},{"id":0,"locationId":20,"code":"SC-gzh","name":"Sai Collection, Sahibabad","isActive":true,"officeAddress":"GZH","locality":null,"city":"Gaziabad","pincode":"200001","orgId":1,"companyId":1,"zoneId":4,"stateId":4021,"countryId":101,"locationType":5,"stateName":"","countryName":"","orgName":"AH - Ananya Herbal","companyName":"AH - Delhi-NCR","zoneName":"Delhi-Gaziabad","email":"sc-gzh@abc.com","alternateEmail":null,"contactNo":"2345678910","alternateContactNo":null,"longitude":"77.074142","latitude":"28.628155","modifiedDt":"2024-05-07T20:39:11.9551925","modifiedBy":"Admin","modifiedRemarks":"","requestedDt":"2024-06-09T12:32:33.6364921+05:30","requestedBy":null,"requestedRemarks":null,"approvalDt":null,"approvalBy":null,"approvalRemarks":"","entityType":0,"approvalStatus":0},{"id":0,"locationId":21,"code":"SS-GHZ","name":"Shakti Store Ghaziabad","isActive":true,"officeAddress":"GHZ","locality":null,"city":"Gaziabad","pincode":"200001","orgId":1,"companyId":1,"zoneId":4,"stateId":4022,"countryId":101,"locationType":5,"stateName":"","countryName":"","orgName":"AH - Ananya Herbal","companyName":"AH - Delhi-NCR","zoneName":"Delhi-Gaziabad","email":"ss-ghz@abc.com","alternateEmail":null,"contactNo":"234567890","alternateContactNo":null,"longitude":"77.074142","latitude":"28.628155","modifiedDt":"2024-05-07T20:40:47.5982439","modifiedBy":"Admin","modifiedRemarks":"","requestedDt":"2024-06-09T12:32:33.636776+05:30","requestedBy":null,"requestedRemarks":null,"approvalDt":null,"approvalBy":null,"approvalRemarks":"","entityType":0,"approvalStatus":0},{"id":0,"locationId":22,"code":"KAJ-mh","name":"Kushal Art Jewellry","isActive":true,"officeAddress":"MH","locality":null,"city":"Mumbai","pincode":"400001","orgId":1,"companyId":3,"zoneId":5,"stateId":4008,"countryId":101,"locationType":5,"stateName":"","countryName":"","orgName":"AH - Ananya Herbal","companyName":"MH - Maharashtra","zoneName":"Mumbai","email":"kaj@abc.com","alternateEmail":null,"contactNo":"1234567890","alternateContactNo":null,"longitude":"77.074142","latitude":"28.628155","modifiedDt":"2024-05-07T20:42:17.6175553","modifiedBy":"Admin","modifiedRemarks":"","requestedDt":"2024-06-09T12:32:33.6368963+05:30","requestedBy":null,"requestedRemarks":null,"approvalDt":null,"approvalBy":null,"approvalRemarks":"","entityType":0,"approvalStatus":0},{"id":0,"locationId":23,"code":"MM-mh","name":"Mazgaon, Mumbai","isActive":true,"officeAddress":"MH","locality":null,"city":"Mumbai","pincode":"400001","orgId":1,"companyId":3,"zoneId":5,"stateId":4008,"countryId":101,"locationType":5,"stateName":"","countryName":"","orgName":"AH - Ananya Herbal","companyName":"MH - Maharashtra","zoneName":"Mumbai","email":"mm@abc.com","alternateEmail":null,"contactNo":"1234567890","alternateContactNo":null,"longitude":"77.074142","latitude":"28.628155","modifiedDt":"2024-05-07T20:43:13.6020582","modifiedBy":"Admin","modifiedRemarks":"","requestedDt":"2024-06-09T12:32:33.6370216+05:30","requestedBy":null,"requestedRemarks":null,"approvalDt":null,"approvalBy":null,"approvalRemarks":"","entityType":0,"approvalStatus":0},{"id":0,"locationId":24,"code":"M-AR","name":"Mumbai - All Regions","isActive":true,"officeAddress":"MH","locality":null,"city":"Mumbai","pincode":"400001","orgId":1,"companyId":3,"zoneId":5,"stateId":4008,"countryId":101,"locationType":5,"stateName":"","countryName":"","orgName":"AH - Ananya Herbal","companyName":"MH - Maharashtra","zoneName":"Mumbai","email":"m-ar@abc.com","alternateEmail":null,"contactNo":"1234567890","alternateContactNo":null,"longitude":"77.074142","latitude":"28.628155","modifiedDt":"2024-05-07T20:44:17.8252727","modifiedBy":"Admin","modifiedRemarks":"","requestedDt":"2024-06-09T12:32:33.6371331+05:30","requestedBy":null,"requestedRemarks":null,"approvalDt":null,"approvalBy":null,"approvalRemarks":"","entityType":0,"approvalStatus":0},{"id":0,"locationId":25,"code":"AHQ","name":"Agra HQ Branch","isActive":true,"officeAddress":"Agr","locality":null,"city":"Agra","pincode":"200001","orgId":1,"companyId":4,"zoneId":6,"stateId":4022,"countryId":101,"locationType":5,"stateName":"","countryName":"","orgName":"AH - Ananya Herbal","companyName":"UP - Uttar Pradesh","zoneName":"Agra","email":"ahq@abc.com","alternateEmail":null,"contactNo":"1234567890","alternateContactNo":null,"longitude":"77.074142","latitude":"28.628155","modifiedDt":"2024-05-07T20:46:50.1702838","modifiedBy":"Admin","modifiedRemarks":"","requestedDt":"2024-06-09T12:32:33.6372364+05:30","requestedBy":null,"requestedRemarks":null,"approvalDt":null,"approvalBy":null,"approvalRemarks":"","entityType":0,"approvalStatus":0},{"id":0,"locationId":26,"code":"AB-up","name":"Asha Bangle","isActive":true,"officeAddress":"UP","locality":null,"city":"Agra","pincode":"200001","orgId":1,"companyId":4,"zoneId":6,"stateId":4022,"countryId":101,"locationType":5,"stateName":"","countryName":"","orgName":"AH - Ananya Herbal","companyName":"UP - Uttar Pradesh","zoneName":"Agra","email":"ab@abc.com","alternateEmail":null,"contactNo":"1234567890","alternateContactNo":null,"longitude":"77.074142","latitude":"28.628155","modifiedDt":"2024-05-07T20:47:50.938566","modifiedBy":"Admin","modifiedRemarks":"","requestedDt":"2024-06-09T12:32:33.6373368+05:30","requestedBy":null,"requestedRemarks":null,"approvalDt":null,"approvalBy":null,"approvalRemarks":"","entityType":0,"approvalStatus":0},{"id":0,"locationId":27,"code":"GA","name":"Giriraj Agra","isActive":true,"officeAddress":"UP","locality":null,"city":"Agra","pincode":"200001","orgId":1,"companyId":4,"zoneId":6,"stateId":4022,"countryId":101,"locationType":5,"stateName":"","countryName":"","orgName":"AH - Ananya Herbal","companyName":"UP - Uttar Pradesh","zoneName":"Agra","email":"ga@abc.com","alternateEmail":null,"contactNo":"1234567890","alternateContactNo":null,"longitude":"77.074142","latitude":"28.628155","modifiedDt":"2024-05-07T20:48:59.4389228","modifiedBy":"Admin","modifiedRemarks":"","requestedDt":"2024-06-09T12:32:33.6374568+05:30","requestedBy":null,"requestedRemarks":null,"approvalDt":null,"approvalBy":null,"approvalRemarks":"","entityType":0,"approvalStatus":0},{"id":0,"locationId":28,"code":"AB","name":"Aligargh Branch(Imran Cosmetic)","isActive":true,"officeAddress":"UP","locality":null,"city":"Agra","pincode":"200001","orgId":1,"companyId":4,"zoneId":7,"stateId":4022,"countryId":101,"locationType":5,"stateName":"","countryName":"","orgName":"AH - Ananya Herbal","companyName":"UP - Uttar Pradesh","zoneName":"Aligargh","email":"ab@abc.com","alternateEmail":null,"contactNo":"1234567890","alternateContactNo":null,"longitude":"77.074142","latitude":"28.628155","modifiedDt":"2024-05-07T20:49:59.0336615","modifiedBy":"Admin","modifiedRemarks":"","requestedDt":"2024-06-09T12:32:33.6375814+05:30","requestedBy":null,"requestedRemarks":null,"approvalDt":null,"approvalBy":null,"approvalRemarks":"","entityType":0,"approvalStatus":0},{"id":0,"locationId":29,"code":"rbrgs","name":"Raja General store- Aligarh","isActive":true,"officeAddress":"UP","locality":null,"city":"Aligarh","pincode":"200001","orgId":1,"companyId":4,"zoneId":7,"stateId":4022,"countryId":101,"locationType":5,"stateName":"","countryName":"","orgName":"AH - Ananya Herbal","companyName":"UP - Uttar Pradesh","zoneName":"Aligargh","email":"rbrgs@abc.com","alternateEmail":null,"contactNo":"1234567890","alternateContactNo":null,"longitude":"77.074142","latitude":"28.628155","modifiedDt":"2024-05-07T20:51:29.4952856","modifiedBy":"Admin","modifiedRemarks":"","requestedDt":"2024-06-09T12:32:33.6377085+05:30","requestedBy":null,"requestedRemarks":null,"approvalDt":null,"approvalBy":null,"approvalRemarks":"","entityType":0,"approvalStatus":0},{"id":0,"locationId":30,"code":"ANS-up","name":"Al-Nisha Store - Aligarh","isActive":true,"officeAddress":"UP","locality":null,"city":"Aligarh","pincode":"200001","orgId":1,"companyId":4,"zoneId":7,"stateId":4022,"countryId":101,"locationType":5,"stateName":"","countryName":"","orgName":"AH - Ananya Herbal","companyName":"UP - Uttar Pradesh","zoneName":"Aligargh","email":"ans@abc.com","alternateEmail":null,"contactNo":"1234567890","alternateContactNo":null,"longitude":"77.074142","latitude":"28.628155","modifiedDt":"2024-05-07T20:52:41.0393701","modifiedBy":"Admin","modifiedRemarks":"","requestedDt":"2024-06-09T12:32:33.6378112+05:30","requestedBy":null,"requestedRemarks":null,"approvalDt":null,"approvalBy":null,"approvalRemarks":"","entityType":0,"approvalStatus":0},{"id":0,"locationId":31,"code":"vs-up","name":"Vinayak Store- Aligarh","isActive":true,"officeAddress":"UP","locality":null,"city":"Aligarh","pincode":"200001","orgId":1,"companyId":4,"zoneId":7,"stateId":4022,"countryId":101,"locationType":5,"stateName":"","countryName":"","orgName":"AH - Ananya Herbal","companyName":"UP - Uttar Pradesh","zoneName":"Aligargh","email":"vs@bac.com","alternateEmail":null,"contactNo":"1234567899","alternateContactNo":null,"longitude":"77.074142","latitude":"28.628155","modifiedDt":"2024-05-07T20:53:47.5431752","modifiedBy":"Admin","modifiedRemarks":"","requestedDt":"2024-06-09T12:32:33.6379305+05:30","requestedBy":null,"requestedRemarks":null,"approvalDt":null,"approvalBy":null,"approvalRemarks":"","entityType":0,"approvalStatus":0},{"id":0,"locationId":32,"code":"AT-k","name":"Archna Traders- Kanpur","isActive":true,"officeAddress":"up","locality":null,"city":"Kanpur","pincode":"200001","orgId":1,"companyId":4,"zoneId":8,"stateId":4022,"countryId":101,"locationType":5,"stateName":"","countryName":"","orgName":"AH - Ananya Herbal","companyName":"UP - Uttar Pradesh","zoneName":"Kanpur","email":"at@abc.com","alternateEmail":null,"contactNo":"1478529630","alternateContactNo":null,"longitude":"77.074142","latitude":"28.628155","modifiedDt":"2024-05-07T20:55:01.4842201","modifiedBy":"Admin","modifiedRemarks":"","requestedDt":"2024-06-09T12:32:33.6380376+05:30","requestedBy":null,"requestedRemarks":null,"approvalDt":null,"approvalBy":null,"approvalRemarks":"","entityType":0,"approvalStatus":0},{"id":0,"locationId":33,"code":"AGS-up","name":"Arvinder General Store - Kanpur","isActive":true,"officeAddress":"up","locality":null,"city":"Kanpur","pincode":"200001","orgId":1,"companyId":4,"zoneId":8,"stateId":4022,"countryId":101,"locationType":5,"stateName":"","countryName":"","orgName":"AH - Ananya Herbal","companyName":"UP - Uttar Pradesh","zoneName":"Kanpur","email":"ags@abc.com","alternateEmail":null,"contactNo":"1478529630","alternateContactNo":null,"longitude":"77.074142","latitude":"28.628155","modifiedDt":"2024-05-07T20:56:09.1159346","modifiedBy":"Admin","modifiedRemarks":"","requestedDt":"2024-06-09T12:32:33.638139+05:30","requestedBy":null,"requestedRemarks":null,"approvalDt":null,"approvalBy":null,"approvalRemarks":"","entityType":0,"approvalStatus":0},{"id":0,"locationId":34,"code":"us-up","name":"Utshab Store- Kanpur","isActive":true,"officeAddress":"up","locality":null,"city":"Kanpur","pincode":"200001","orgId":1,"companyId":4,"zoneId":8,"stateId":4022,"countryId":101,"locationType":5,"stateName":"","countryName":"","orgName":"AH - Ananya Herbal","companyName":"UP - Uttar Pradesh","zoneName":"Kanpur","email":"us@abc.com","alternateEmail":null,"contactNo":"1234567890","alternateContactNo":null,"longitude":"77.074142","latitude":"28.628155","modifiedDt":"2024-05-07T20:57:10.2113602","modifiedBy":"Admin","modifiedRemarks":"","requestedDt":"2024-06-09T12:32:33.6382386+05:30","requestedBy":null,"requestedRemarks":null,"approvalDt":null,"approvalBy":null,"approvalRemarks":"","entityType":0,"approvalStatus":0},{"id":0,"locationId":35,"code":"DGS-upp","name":"Deepak general Store- Kanpur","isActive":true,"officeAddress":"UP","locality":null,"city":"Kanpur","pincode":"200001","orgId":1,"companyId":4,"zoneId":8,"stateId":4022,"countryId":101,"locationType":5,"stateName":"","countryName":"","orgName":"AH - Ananya Herbal","companyName":"UP - Uttar Pradesh","zoneName":"Kanpur","email":"dgs@abc.com","alternateEmail":null,"contactNo":"1234567950","alternateContactNo":null,"longitude":"77.074142","latitude":"28.628155","modifiedDt":"2024-05-07T20:58:15.4910846","modifiedBy":"Admin","modifiedRemarks":"","requestedDt":"2024-06-09T12:32:33.6383627+05:30","requestedBy":null,"requestedRemarks":null,"approvalDt":null,"approvalBy":null,"approvalRemarks":"","entityType":0,"approvalStatus":0},{"id":0,"locationId":36,"code":"mk","name":"Manglam- Kanpur","isActive":true,"officeAddress":"UP","locality":null,"city":"Kanpur","pincode":"200001","orgId":1,"companyId":4,"zoneId":8,"stateId":4022,"countryId":101,"locationType":5,"stateName":"","countryName":"","orgName":"AH - Ananya Herbal","companyName":"UP - Uttar Pradesh","zoneName":"Kanpur","email":"mk@abc.com","alternateEmail":null,"contactNo":"1234567980","alternateContactNo":null,"longitude":"77.074142","latitude":"28.628155","modifiedDt":"2024-05-07T20:59:14.929237","modifiedBy":"Admin","modifiedRemarks":"","requestedDt":"2024-06-09T12:32:33.6384724+05:30","requestedBy":null,"requestedRemarks":null,"approvalDt":null,"approvalBy":null,"approvalRemarks":"","entityType":0,"approvalStatus":0},{"id":0,"locationId":37,"code":"bs","name":"Bharat Store - Lucknow","isActive":true,"officeAddress":"UP","locality":null,"city":"Lucknow","pincode":"200001","orgId":1,"companyId":4,"zoneId":9,"stateId":4022,"countryId":101,"locationType":5,"stateName":"","countryName":"","orgName":"AH - Ananya Herbal","companyName":"UP - Uttar Pradesh","zoneName":"Lucknow","email":"bs@abc.com","alternateEmail":null,"contactNo":"1234567890","alternateContactNo":null,"longitude":"77.074142","latitude":"28.628155","modifiedDt":"2024-05-07T21:01:55.281819","modifiedBy":"Admin","modifiedRemarks":"","requestedDt":"2024-06-09T12:32:33.6386211+05:30","requestedBy":null,"requestedRemarks":null,"approvalDt":null,"approvalBy":null,"approvalRemarks":"","entityType":0,"approvalStatus":0},{"id":0,"locationId":38,"code":"iblm-up","name":"ISR Based Lucknow Market","isActive":true,"officeAddress":"UP","locality":null,"city":"Lucknow","pincode":"200001","orgId":1,"companyId":4,"zoneId":9,"stateId":4022,"countryId":101,"locationType":5,"stateName":"","countryName":"","orgName":"AH - Ananya Herbal","companyName":"UP - Uttar Pradesh","zoneName":"Lucknow","email":"iblm@abc.com","alternateEmail":null,"contactNo":"1234567890","alternateContactNo":null,"longitude":"77.074142","latitude":"28.628155","modifiedDt":"2024-05-07T21:02:59.4489396","modifiedBy":"Admin","modifiedRemarks":"","requestedDt":"2024-06-09T12:32:33.6387432+05:30","requestedBy":null,"requestedRemarks":null,"approvalDt":null,"approvalBy":null,"approvalRemarks":"","entityType":0,"approvalStatus":0},{"id":0,"locationId":39,"code":"LZL-up","name":"Ladies Zone Lucknow","isActive":true,"officeAddress":"UP","locality":null,"city":"Lucknow","pincode":"200001","orgId":1,"companyId":4,"zoneId":9,"stateId":4022,"countryId":101,"locationType":5,"stateName":"","countryName":"","orgName":"AH - Ananya Herbal","companyName":"UP - Uttar Pradesh","zoneName":"Lucknow","email":"lzl@abc.com","alternateEmail":null,"contactNo":"1234567890","alternateContactNo":null,"longitude":"77.074142","latitude":"28.628155","modifiedDt":"2024-05-07T21:04:01.8582913","modifiedBy":"Admin","modifiedRemarks":"","requestedDt":"2024-06-09T12:32:33.638859+05:30","requestedBy":null,"requestedRemarks":null,"approvalDt":null,"approvalBy":null,"approvalRemarks":"","entityType":0,"approvalStatus":0},{"id":0,"locationId":40,"code":"xl","name":"Xaxatisify - Lucknow","isActive":true,"officeAddress":"UP","locality":null,"city":"Lucknow","pincode":"200001","orgId":1,"companyId":4,"zoneId":9,"stateId":4022,"countryId":101,"locationType":5,"stateName":"","countryName":"","orgName":"AH - Ananya Herbal","companyName":"UP - Uttar Pradesh","zoneName":"Lucknow","email":"xl@abc.com","alternateEmail":null,"contactNo":"1234567890","alternateContactNo":null,"longitude":"77.074142","latitude":"28.628155","modifiedDt":"2024-05-07T21:04:59.2042004","modifiedBy":"Admin","modifiedRemarks":"","requestedDt":"2024-06-09T12:32:33.6392305+05:30","requestedBy":null,"requestedRemarks":null,"approvalDt":null,"approvalBy":null,"approvalRemarks":"","entityType":0,"approvalStatus":0},{"id":0,"locationId":41,"code":"vb-up","name":"Vijay Beauty - Moradabad","isActive":true,"officeAddress":"up","locality":null,"city":"Moradabad","pincode":"200001","orgId":1,"companyId":4,"zoneId":10,"stateId":4022,"countryId":101,"locationType":5,"stateName":"","countryName":"","orgName":"AH - Ananya Herbal","companyName":"UP - Uttar Pradesh","zoneName":"Muradabad","email":"vb@abc.com","alternateEmail":null,"contactNo":"1234567890","alternateContactNo":null,"longitude":"77.074142","latitude":"28.628155","modifiedDt":"2024-05-07T21:06:03.4266191","modifiedBy":"Admin","modifiedRemarks":"","requestedDt":"2024-06-09T12:32:33.6396684+05:30","requestedBy":null,"requestedRemarks":null,"approvalDt":null,"approvalBy":null,"approvalRemarks":"","entityType":0,"approvalStatus":0},{"id":0,"locationId":42,"code":"su-up","name":"Shringarika, Unnao","isActive":true,"officeAddress":"UP","locality":null,"city":"Unnao","pincode":"200001","orgId":1,"companyId":4,"zoneId":11,"stateId":4022,"countryId":101,"locationType":5,"stateName":"","countryName":"","orgName":"AH - Ananya Herbal","companyName":"UP - Uttar Pradesh","zoneName":"Unnao","email":"su@abc.com","alternateEmail":null,"contactNo":"1234567890","alternateContactNo":null,"longitude":"77.074142","latitude":"28.628155","modifiedDt":"2024-05-07T21:07:06.310181","modifiedBy":"Admin","modifiedRemarks":"","requestedDt":"2024-06-09T12:32:33.6398473+05:30","requestedBy":null,"requestedRemarks":null,"approvalDt":null,"approvalBy":null,"approvalRemarks":"","entityType":0,"approvalStatus":0}]
/// token : null

class GetAllLocationResponse {
  GetAllLocationResponse({
      num? messageType, 
      dynamic error, 
      String? message, 
      List<LocationList>? data,
      dynamic token,}){
    _messageType = messageType;
    _error = error;
    _message = message;
    _data = data;
    _token = token;
}

  GetAllLocationResponse.fromJson(dynamic json) {
    _messageType = json['messageType'];
    _error = json['error'];
    _message = json['message'];
    if (json['returnId'] != null) {
      _data = [];
      json['returnId'].forEach((v) {
        _data?.add(LocationList.fromJson(v));
      });
    }
    _token = json['token'];
  }
  num? _messageType;
  dynamic _error;
  String? _message;
  List<LocationList>? _data;
  dynamic _token;
GetAllLocationResponse copyWith({  num? messageType,
  dynamic error,
  String? message,
  List<LocationList>? data,
  dynamic token,
}) => GetAllLocationResponse(  messageType: messageType ?? _messageType,
  error: error ?? _error,
  message: message ?? _message,
  data: data ?? _data,
  token: token ?? _token,
);
  num? get messageType => _messageType;
  dynamic get error => _error;
  String? get message => _message;
  List<LocationList>? get data => _data;
  dynamic get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['messageType'] = _messageType;
    map['error'] = _error;
    map['message'] = _message;
    if (_data != null) {
      map['returnId'] = _data?.map((v) => v.toJson()).toList();
    }
    map['token'] = _token;
    return map;
  }

}

/// id : 0
/// locationId : 1
/// code : "HO"
/// name : "Head Office"
/// isActive : true
/// officeAddress : null
/// locality : "A-1/175, 2rd Floor, Main Najafgarh Road"
/// city : ""
/// pincode : "110018"
/// orgId : 1
/// companyId : 1
/// zoneId : 1
/// stateId : 4021
/// countryId : 101
/// locationType : 1
/// stateName : ""
/// countryName : ""
/// orgName : "AH - Ananya Herbal"
/// companyName : "AH - Delhi-NCR"
/// zoneName : "India"
/// email : ""
/// alternateEmail : ""
/// contactNo : ""
/// alternateContactNo : ""
/// longitude : "77.074142"
/// latitude : "28.628155"
/// modifiedDt : "2000-01-01T00:00:00"
/// modifiedBy : "System"
/// modifiedRemarks : ""
/// requestedDt : "2024-06-09T12:32:33.5558764+05:30"
/// requestedBy : null
/// requestedRemarks : null
/// approvalDt : null
/// approvalBy : null
/// approvalRemarks : ""
/// entityType : 0
/// approvalStatus : 0

class LocationList {
  LocationList({
      num? id, 
      num? locationId, 
      String? code, 
      String? name, 
      bool? isActive, 
      dynamic officeAddress, 
      String? locality, 
      String? city, 
      String? pincode, 
      num? orgId, 
      num? companyId, 
      num? zoneId, 
      num? stateId, 
      num? countryId, 
      num? locationType, 
      String? stateName, 
      String? countryName, 
      String? orgName, 
      String? companyName, 
      String? zoneName, 
      String? email, 
      String? alternateEmail, 
      String? contactNo, 
      String? alternateContactNo, 
      String? longitude, 
      String? latitude, 
      String? modifiedDt, 
      String? modifiedBy, 
      String? modifiedRemarks, 
      String? requestedDt, 
      dynamic requestedBy, 
      dynamic requestedRemarks, 
      dynamic approvalDt, 
      dynamic approvalBy, 
      String? approvalRemarks, 
      num? entityType, 
      num? approvalStatus,

  }){
    _id = id;
    _locationId = locationId;
    _code = code;
    _name = name;
    _isActive = isActive;
    _officeAddress = officeAddress;
    _locality = locality;
    _city = city;
    _pincode = pincode;
    _orgId = orgId;
    _companyId = companyId;
    _zoneId = zoneId;
    _stateId = stateId;
    _countryId = countryId;
    _locationType = locationType;
    _stateName = stateName;
    _countryName = countryName;
    _orgName = orgName;
    _companyName = companyName;
    _zoneName = zoneName;
    _email = email;
    _alternateEmail = alternateEmail;
    _contactNo = contactNo;
    _alternateContactNo = alternateContactNo;
    _longitude = longitude;
    _latitude = latitude;
    _modifiedDt = modifiedDt;
    _modifiedBy = modifiedBy;
    _modifiedRemarks = modifiedRemarks;
    _requestedDt = requestedDt;
    _requestedBy = requestedBy;
    _requestedRemarks = requestedRemarks;
    _approvalDt = approvalDt;
    _approvalBy = approvalBy;
    _approvalRemarks = approvalRemarks;
    _entityType = entityType;
    _approvalStatus = approvalStatus;
}

  LocationList.fromJson(dynamic json) {
    _id = json['id'];
    _locationId = json['locationId'];
    _code = json['code'];
    _name = json['name'];
    _isActive = json['isActive'];
    _officeAddress = json['officeAddress'];
    _locality = json['locality'];
    _city = json['city'];
    _pincode = json['pincode'];
    _orgId = json['orgId'];
    _companyId = json['companyId'];
    _zoneId = json['zoneId'];
    _stateId = json['stateId'];
    _countryId = json['countryId'];
    _locationType = json['locationType'];
    _stateName = json['stateName'];
    _countryName = json['countryName'];
    _orgName = json['orgName'];
    _companyName = json['companyName'];
    _zoneName = json['zoneName'];
    _email = json['email'];
    _alternateEmail = json['alternateEmail'];
    _contactNo = json['contactNo'];
    _alternateContactNo = json['alternateContactNo'];
    _longitude = json['longitude'];
    _latitude = json['latitude'];
    _modifiedDt = json['modifiedDt'];
    _modifiedBy = json['modifiedBy'];
    _modifiedRemarks = json['modifiedRemarks'];
    _requestedDt = json['requestedDt'];
    _requestedBy = json['requestedBy'];
    _requestedRemarks = json['requestedRemarks'];
    _approvalDt = json['approvalDt'];
    _approvalBy = json['approvalBy'];
    _approvalRemarks = json['approvalRemarks'];
    _entityType = json['entityType'];
    _approvalStatus = json['approvalStatus'];
  }
  num? _id;
  num? _locationId;
  String? _code;
  String? _name;
  bool? _isActive;
  dynamic _officeAddress;
  String? _locality;
  String? _city;
  String? _pincode;
  num? _orgId;
  num? _companyId;
  num? _zoneId;
  num? _stateId;
  num? _countryId;
  num? _locationType;
  String? _stateName;
  String? _countryName;
  String? _orgName;
  String? _companyName;
  String? _zoneName;
  String? _email;
  String? _alternateEmail;
  String? _contactNo;
  String? _alternateContactNo;
  String? _longitude;
  String? _latitude;
  String? _modifiedDt;
  String? _modifiedBy;
  String? _modifiedRemarks;
  String? _requestedDt;
  dynamic _requestedBy;
  dynamic _requestedRemarks;
  dynamic _approvalDt;
  dynamic _approvalBy;
  String? _approvalRemarks;
  num? _entityType;
  num? _approvalStatus;
  RxBool isSelected= false.obs;
  RxString isDate= ''.obs;

LocationList copyWith({  num? id,
  num? locationId,
  String? code,
  String? name,
  bool? isActive,
  dynamic officeAddress,
  String? locality,
  String? city,
  String? pincode,
  num? orgId,
  num? companyId,
  num? zoneId,
  num? stateId,
  num? countryId,
  num? locationType,
  String? stateName,
  String? countryName,
  String? orgName,
  String? companyName,
  String? zoneName,
  String? email,
  String? alternateEmail,
  String? contactNo,
  String? alternateContactNo,
  String? longitude,
  String? latitude,
  String? modifiedDt,
  String? modifiedBy,
  String? modifiedRemarks,
  String? requestedDt,
  dynamic requestedBy,
  dynamic requestedRemarks,
  dynamic approvalDt,
  dynamic approvalBy,
  String? approvalRemarks,
  num? entityType,
  num? approvalStatus,
}) => LocationList(  id: id ?? _id,
  locationId: locationId ?? _locationId,
  code: code ?? _code,
  name: name ?? _name,
  isActive: isActive ?? _isActive,
  officeAddress: officeAddress ?? _officeAddress,
  locality: locality ?? _locality,
  city: city ?? _city,
  pincode: pincode ?? _pincode,
  orgId: orgId ?? _orgId,
  companyId: companyId ?? _companyId,
  zoneId: zoneId ?? _zoneId,
  stateId: stateId ?? _stateId,
  countryId: countryId ?? _countryId,
  locationType: locationType ?? _locationType,
  stateName: stateName ?? _stateName,
  countryName: countryName ?? _countryName,
  orgName: orgName ?? _orgName,
  companyName: companyName ?? _companyName,
  zoneName: zoneName ?? _zoneName,
  email: email ?? _email,
  alternateEmail: alternateEmail ?? _alternateEmail,
  contactNo: contactNo ?? _contactNo,
  alternateContactNo: alternateContactNo ?? _alternateContactNo,
  longitude: longitude ?? _longitude,
  latitude: latitude ?? _latitude,
  modifiedDt: modifiedDt ?? _modifiedDt,
  modifiedBy: modifiedBy ?? _modifiedBy,
  modifiedRemarks: modifiedRemarks ?? _modifiedRemarks,
  requestedDt: requestedDt ?? _requestedDt,
  requestedBy: requestedBy ?? _requestedBy,
  requestedRemarks: requestedRemarks ?? _requestedRemarks,
  approvalDt: approvalDt ?? _approvalDt,
  approvalBy: approvalBy ?? _approvalBy,
  approvalRemarks: approvalRemarks ?? _approvalRemarks,
  entityType: entityType ?? _entityType,
  approvalStatus: approvalStatus ?? _approvalStatus,
);
  num? get id => _id;
  num? get locationId => _locationId;
  String? get code => _code;
  String? get name => _name;
  bool? get isActive => _isActive;
  dynamic get officeAddress => _officeAddress;
  String? get locality => _locality;
  String? get city => _city;
  String? get pincode => _pincode;
  num? get orgId => _orgId;
  num? get companyId => _companyId;
  num? get zoneId => _zoneId;
  num? get stateId => _stateId;
  num? get countryId => _countryId;
  num? get locationType => _locationType;
  String? get stateName => _stateName;
  String? get countryName => _countryName;
  String? get orgName => _orgName;
  String? get companyName => _companyName;
  String? get zoneName => _zoneName;
  String? get email => _email;
  String? get alternateEmail => _alternateEmail;
  String? get contactNo => _contactNo;
  String? get alternateContactNo => _alternateContactNo;
  String? get longitude => _longitude;
  String? get latitude => _latitude;
  String? get modifiedDt => _modifiedDt;
  String? get modifiedBy => _modifiedBy;
  String? get modifiedRemarks => _modifiedRemarks;
  String? get requestedDt => _requestedDt;
  dynamic get requestedBy => _requestedBy;
  dynamic get requestedRemarks => _requestedRemarks;
  dynamic get approvalDt => _approvalDt;
  dynamic get approvalBy => _approvalBy;
  String? get approvalRemarks => _approvalRemarks;
  num? get entityType => _entityType;
  num? get approvalStatus => _approvalStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['locationId'] = _locationId;
    map['code'] = _code;
    map['name'] = _name;
    map['isActive'] = _isActive;
    map['officeAddress'] = _officeAddress;
    map['locality'] = _locality;
    map['city'] = _city;
    map['pincode'] = _pincode;
    map['orgId'] = _orgId;
    map['companyId'] = _companyId;
    map['zoneId'] = _zoneId;
    map['stateId'] = _stateId;
    map['countryId'] = _countryId;
    map['locationType'] = _locationType;
    map['stateName'] = _stateName;
    map['countryName'] = _countryName;
    map['orgName'] = _orgName;
    map['companyName'] = _companyName;
    map['zoneName'] = _zoneName;
    map['email'] = _email;
    map['alternateEmail'] = _alternateEmail;
    map['contactNo'] = _contactNo;
    map['alternateContactNo'] = _alternateContactNo;
    map['longitude'] = _longitude;
    map['latitude'] = _latitude;
    map['modifiedDt'] = _modifiedDt;
    map['modifiedBy'] = _modifiedBy;
    map['modifiedRemarks'] = _modifiedRemarks;
    map['requestedDt'] = _requestedDt;
    map['requestedBy'] = _requestedBy;
    map['requestedRemarks'] = _requestedRemarks;
    map['approvalDt'] = _approvalDt;
    map['approvalBy'] = _approvalBy;
    map['approvalRemarks'] = _approvalRemarks;
    map['entityType'] = _entityType;
    map['approvalStatus'] = _approvalStatus;
    return map;
  }

}