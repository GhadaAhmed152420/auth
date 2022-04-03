import 'package:wallet_app/models/counter_model.dart';

class HomeViewModel{
  //this will provide all data that view need
  String title = 'Home Page';
  var counterModel = CounterModel();

  getCounter(){
    return counterModel.count;
  }

  inc(){
    return counterModel.count++;
  }

}