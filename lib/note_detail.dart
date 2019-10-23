import 'package:flutter/material.dart';

class NoteDetail extends StatefulWidget {

	String appBarTitle;

	NoteDetail(this.appBarTitle);

	@override
  State<StatefulWidget> createState() {

    return NoteDetailState(this.appBarTitle);
  }
}

class NoteDetailState extends State<NoteDetail>{

  String appBarTitle;

  NoteDetailState(this.appBarTitle);

  static var _priorities = ['High', 'Low'];

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    TextStyle textStyle = Theme.of(context).textTheme.title;

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: Padding(
        padding: EdgeInsets.only(top:15.0, left:10.0, right:10.0),
        child: ListView(
          children: <Widget>[

            ListTile(

              title: DropdownButton(
							    items: _priorities.map((String dropDownStringItem) {
							    	return DropdownMenuItem<String> (
									    value: dropDownStringItem,
									    child: Text(dropDownStringItem),
								    );
							    }).toList(),
  
              style: textStyle,
              value: 'Low',
              onChanged: (valueSelectByUser){
                setState(() {
                 debugPrint('User selected $valueSelectByUser'); 
                });
              },
              )

            )
            ,

            // Second Element
            Padding(
              padding: EdgeInsets.only(top:15.0, bottom: 15.0),
              child: TextField(
                controller: titleController,
                style: textStyle,
                onChanged: (value){
                  debugPrint("Something is changed in title field.");
                },
                decoration: InputDecoration(
                  labelText: 'Title',
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      5.0
                    )
                  )
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top:15.0, bottom: 15.0),
              child: TextField(
                controller: descriptionController,
                style: textStyle,
                onChanged: (value){
                  debugPrint("Something is changed in description field.");
                },
                decoration: InputDecoration(
                  labelText: 'Description',
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      5.0
                    )
                  )
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top:15.0, bottom: 15.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text("SAVE", textScaleFactor:1.5),
                      onPressed: (){
                        setState(() {
                         debugPrint("Save button clicked"); 
                        });
                      },
                    ),
                  ),

                 Container(
                   width: 5.0,
                 ),

                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text("DELETE", textScaleFactor:1.5),
                      onPressed: (){
                        setState(() {
                         debugPrint("Delete button clicked"); 
                        });
                      },
                    ),
                  )
                ],
              ),
            )

          ],  
        ),
      ),
    );
  }

}