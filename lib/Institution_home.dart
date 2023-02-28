import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:picozen_final/teacher.dart';
class Institution_Home extends StatefulWidget {
  const Institution_Home({Key? key}) : super(key: key);

  @override
  _Institution_HomeState createState() => _Institution_HomeState();
}

class _Institution_HomeState extends State<Institution_Home> {
  final CollectionReference _workshop_registration =
  FirebaseFirestore.instance.collection('workshop_registration');
  final TextEditingController _websitetitlecontroller = TextEditingController();
  final TextEditingController _aboutcontroller = TextEditingController();
  Future<void> _update([DocumentSnapshot? documentSnapshot])async{
    if(documentSnapshot !=null){
      _websitetitlecontroller.text = documentSnapshot['workshoptitle'];
      _aboutcontroller.text= documentSnapshot['about'];
    }
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder:(BuildContext ctx){
          return Padding(padding: EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
              bottom: MediaQuery.of(ctx).viewInsets.bottom+20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _websitetitlecontroller,
                    decoration: const InputDecoration(labelText: 'Title'),
                  ),
                  TextField(
                    controller: _aboutcontroller,
                    decoration: const InputDecoration(labelText: 'about'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      child: const Text('Update'),
                      onPressed: () async{
                        final String Title = _websitetitlecontroller.text;
                        final String about = _aboutcontroller.text;
                        if(about !=null){
                          await _workshop_registration
                              .doc(documentSnapshot!.id)
                              .update({"workshoptitle" : Title,"about": about});
                          _websitetitlecontroller.text="";
                          _aboutcontroller.text="";
                          Navigator.of(context).pop();
                        }
                      }
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
  Future<void> _create([DocumentSnapshot? documentSnapshot])async{
    if(documentSnapshot !=null){
      _websitetitlecontroller.text = documentSnapshot['workshoptitle'];
      _aboutcontroller.text= documentSnapshot['about'];
    }
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder:(BuildContext ctx){
          return Padding(padding: EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
              bottom: MediaQuery.of(ctx).viewInsets.bottom+20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _websitetitlecontroller,
                  decoration: const InputDecoration(labelText: 'Title'),
                ),
                TextField(
                  controller: _aboutcontroller,
                  decoration: const InputDecoration(labelText: 'About'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text('Create'),
                  onPressed: () async{
                    final String Title = _websitetitlecontroller.text;
                    final String about = _aboutcontroller.text;
                    if(about!=null){
                      await _workshop_registration.add(
                          {
                            "workshoptitle" : Title,
                            "about": about,
                          });
                      _websitetitlecontroller.text="";
                      _aboutcontroller.text="";
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            ),
          );
        }
    );
  }
  Future<void> _delete(String productId) async{
    await _workshop_registration.doc(productId).delete();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('you have sucessfully deleted a product')
    ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: new DrawerCodeOnly(),
      appBar: new AppBar(
        backgroundColor: Colors.blueGrey,
        title: new Text("Add Events"),
      ),
      body: StreamBuilder(
        stream: _workshop_registration.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot){
          if(streamSnapshot.hasData){
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot=
                streamSnapshot.data!.docs[index];
                return Card(
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(documentSnapshot['workshoptitle']),
                      subtitle: Text(documentSnapshot['about']),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: ()=>
                                  _update(documentSnapshot),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: ()=>
                                  _delete(documentSnapshot.id),
                            )
                          ],
                        ),
                      ),
                    )
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>_create(),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
