import 'package:flutter/material.dart';

class Modal extends StatelessWidget {
  const Modal({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          iconColor: Colors.white,
          shadowColor: null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        ),
        child:
          const Icon(
            Icons.add,
          ),
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 500,
                color: Colors.amber,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text('New expenses'),
                    // input form 
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          labelText: 'Enter new expense',
                        ),
                      ),
                    ),
                    //date pickup
                
                    // close modal
                    // ElevatedButton(
                    //   child: const Text('Close BottomSheet'),
                    //   onPressed: () => Navigator.pop(context),
                    // ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}