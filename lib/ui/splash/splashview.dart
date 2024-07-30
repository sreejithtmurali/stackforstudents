import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:untitled1stack/ui/splash/splashviewmodel.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {

   return  ViewModelBuilder<Splashviewmodel>.reactive(
       onViewModelReady: (model) {
         model.init(context);
       },
    builder: (context, model, child) {
         return model.isBusy?Center(child: CircularProgressIndicator(),):
           Scaffold(
           body: SingleChildScrollView(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Icon(Icons.favorite),
                 TextFormField(
                   controller: model.controller,
                   decoration: InputDecoration(border: OutlineInputBorder()),
                 ),
                 ElevatedButton(onPressed: (){
                   model.printdata();
                 }, child: Text("print")),
                 ListView.builder(
                   shrinkWrap: true,
                   itemCount: model.plist!.length, itemBuilder: (BuildContext context, int index) {
                   return ListTile(
                     leading: CircleAvatar(backgroundImage: NetworkImage('${model.plist![index].thumbnail}'),),
                     title: Text('${model.plist![index].title}'),
                   );
                 },)
               ],
             ),
           ),
         );

    },
     viewModelBuilder: () {
         return Splashviewmodel(age: 12);
   },);
  }
}
