import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {

  runApp(new MaterialApp(
    color: Colors.white,
    debugShowCheckedModeBanner: false,

      home: ChatView()));
}

const primary = const Color(0xfff7b4a1);

class ChatView extends StatelessWidget{

  List Name=["Joe Root",
    "Rachel Green",
    "John Conner",
    "Ross Duffer",
    "David Johanson",
    "Joe Root",
    "Rachel Green",
    "John Conner",
    "Ross Duffer",
    "David Johanson"];
  List Profile=[
    "asset/images/dummy.png",
    "asset/images/dummy2.jpg",
    "asset/images/dummy3.jpg",
    "asset/images/dummy4.png",
    "asset/images/dummy2.jpg",
    "asset/images/dummy.png",
    "asset/images/dummy2.jpg",
    "asset/images/dummy3.jpg",
    "asset/images/dummy.png",
    "asset/images/dummy3.jpg", ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(top: 35),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            app_bar(context),
            horizontal_Layout(),
            chat_List()
          ],
        ),
      ),
    );
  }

  //CUSTOMIZED APP_BAR
  Widget app_bar(BuildContext context) {
    return Container(height: 40,
      child: Stack(alignment: Alignment.center,
        fit: StackFit.loose,
        children: [
          Text("Contacts",style: TextStyle(fontSize: 29,fontFamily: 'fontNew',fontWeight: FontWeight.w600),),
          Row(children: [
              SizedBox(width: 5,),
              Icon(Icons.search_rounded,size: 29,color: Colors.grey.shade400),
              Spacer(),
              Icon(Icons.more_horiz,size: 29,color: Colors.grey.shade400,),
              SizedBox(width: 5,),
            ],),
        ],
      ),
    );
  }

  Widget horizontal_Layout() {
    return Container(
      height: 90,
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 3),
      child: Column(
        children: [
          Row(
            children: [
              Text("ONLINE",style: TextStyle(fontSize: 15.3,fontFamily: 'fontNew',color: Colors.grey.shade400,letterSpacing: 0.7,fontWeight: FontWeight.w700)),
              Spacer(),
              Text("+ ADD FRIENDS",style: TextStyle(fontSize: 15.3,fontFamily: 'fontNew',color: primary,letterSpacing: 0.7,fontWeight: FontWeight.w700))
            ],
          ),
          SizedBox(height: 10,),
          Expanded(
            child: ListView.builder(scrollDirection:Axis.horizontal,itemCount: 10,itemBuilder: (context,index){
              return Container(padding: EdgeInsets.only(right: 12),
                  child: Stack(
                   children: [
                   CircleAvatar(
                    radius: 27,
                    backgroundColor: Colors.pinkAccent.shade100,
                    backgroundImage: AssetImage(Profile[index]),),
                  Padding(
                    padding: const EdgeInsets.only(top: 38.0),
                    child: CircleAvatar(backgroundColor: Colors.white,radius: 8,
                      child: Icon(Icons.circle,size: 11,color: primary,)),
                  )
                ],
              ));
            }),
          )
        ],
      ),
    );
  }



  chat_List() {
    return Expanded(
      child: ListView.builder(itemCount:10,itemBuilder: (context,index){
        return Container(alignment: Alignment.topCenter,
          child: ListTile(
            leading: CircleAvatar(backgroundColor: primary,radius: 26,
            backgroundImage: AssetImage(Profile[index]),),

            title: Text("${Name[index]}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19)),

            subtitle: index==4?
            Text("Typing...",style: TextStyle(color: Colors.lightBlue,fontWeight: FontWeight.bold))
            :index%3==0?Text("Hi How are you?")
                :Text("Hey, What to do?",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),

            trailing: Column(
              children: [
                SizedBox(height: 3,),
                Text("23:00",style: TextStyle(color: Colors.grey)),
                SizedBox(height: 3,),
                index%2==0?
                CircleAvatar(child: Text("3",style: TextStyle(color: Colors.white),),radius: 10,backgroundColor: primary,)
                    :Stack(
                      children: [
                        Icon(Icons.check_rounded,size: 18,color: Colors.grey,),
                        Padding(
                          padding: const EdgeInsets.only(left: 5.4),
                          child: Icon(Icons.check_rounded,size: 18,color: Colors.grey,),
                        ),
                      ],
                    ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
